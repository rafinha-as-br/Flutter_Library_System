
import 'package:flutter/cupertino.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/repositories/repository_book.dart';
import 'package:library_app/usecase/usecase_delete_book.dart';
import 'package:library_app/usecase/usecase_get_available_genders.dart';
import 'package:library_app/usecase/usecase_insert_book.dart';
import 'package:library_app/usecase/usecase_lend_book.dart';
import 'package:library_app/usecase/usecase_return_lend.dart';
import 'package:library_app/usecase/usecase_search_books.dart';
import 'package:library_app/usecase/usecase_search_collection.dart';
import 'package:library_app/usecase/usecase_search_lends.dart';
import 'package:library_app/usecase/usecase_update_book.dart';

import '../../entities/validator.dart';

/// this provider calls all the UseCases
class MainProvider extends ChangeNotifier{
  MainProvider(this.bookRepo);

  /// repositories needed to be passed to the usecases
  final BookRepository bookRepo;

  // this is the variable that controls the homepage tab index
  int homePageIndex = 0;

  /// toggle page method (used in bottomNavBar)
  void togglePage(int index){
    homePageIndex = index;
    editableBook = null;
    bookSuggestionsList = [];
    notifyListeners();
  }

  /// this is the variable that contains a book to be edited
  Book? editableBook;

  /// this methods is used for editing a book in BookFormScreen
  void setBookForEdit(Book book){
    editableBook = book;

    // to go to the BookFormScreen
    homePageIndex = 1;

    notifyListeners();
  }

  void setBookForLend(Book book) {
    editableBook = book;
    notifyListeners();
  }

  // this is the search controller used for controlling the search
  final searchController = TextEditingController();

  /// this is the book suggestion list, used in the book searches
  List<Book> bookSuggestionsList = [];

  /// to clear the book suggestions list
  void clearBookSuggestionsList(){
    bookSuggestionsList = [];
    notifyListeners();
  }

  /// this function delivers a map of available gender in the collection
  Future <Map<String, int>> getGendersMap() async{
    return await getGendersAvailables(bookRepo);
  }


  /// search_books usecase
  void searchBooks(String query) async{
    bookSuggestionsList = await searchBooksUseCase(bookRepo, query);
    notifyListeners();
  }

  /// search_lends usecase
  Future<List<Book>> searchLends() async{
    return await searchLendsUseCase(bookRepo);
  }

  /// return_lend usecase
  Future<Validator> returnLend(String personName) async{
    print("****************** BOOK ID EDITABLE: ${editableBook!.id}");
    return returnLendUseCase(bookRepo, editableBook!, personName);
  }


  /// search_collection by book title usecase
  Future<void> searchByTitleOnCollection(String query) async {
    bookSuggestionsList = await searchCollectionByBookTitleUseCase(bookRepo, query);
    notifyListeners();
  }
  
  /// search_collection by book gender usecase
  Future<List<Book>> searchByGenderOnCollection(String query) async{
    return await searchCollectionByGenderUseCase(bookRepo, query);
  }

  /// lendBook -> Adds a string and
  Future<Validator> lendBook(String personName) async{
    print('BookID: ${editableBook!.id}');
    return await lendBookUseCase(bookRepo, editableBook!, personName);
  }


  /// update_book usecase
  Future<Validator> updateBook(
      String? bookId, String title, String author, String gender, String year, String amount
  ) async{
    final book = Book(
        title: title,
        author: author,
        gender: gender,
        year: int.tryParse(year) ?? 0,
        amount: int.tryParse(amount) ?? 0
    )..id = bookId;

    editableBook = null;
    return updateBookUseCase(bookRepo, book);
  }


  /// delete_book usecase
  Future<Validator> deleteBook(Book book) async{
    return deleteBookUseCase(bookRepo, book);
  }


  /// insert_book usecase
  Future<Validator> insertBook(
    String title, String author, String gender, String year, String amount
    ) async{

    // creating a book entity to pass to the usecase
    Book book = Book(
      title: title,
      author: author,
      year: int.tryParse(year)?? -1,
      gender: gender,
      amount: int.tryParse(amount) ?? -1
    );

    return insertBookUseCase(bookRepo, book);
  }


}