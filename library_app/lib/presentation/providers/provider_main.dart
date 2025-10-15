
import 'package:flutter/cupertino.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/person.dart';
import 'package:library_app/repositories/repository_book.dart';
import 'package:library_app/repositories/repository_person.dart';
import 'package:library_app/usecase/usecase_delete_book.dart';
import 'package:library_app/usecase/usecase_delete_person.dart';
import 'package:library_app/usecase/usecase_get_available_genders.dart';
import 'package:library_app/usecase/usecase_get_persons.dart';
import 'package:library_app/usecase/usecase_insert_book.dart';
import 'package:library_app/usecase/usecase_insert_person.dart';
import 'package:library_app/usecase/usecase_search_books.dart';
import 'package:library_app/usecase/usecase_search_collection.dart';
import 'package:library_app/usecase/usecase_search_person.dart';
import 'package:library_app/usecase/usecase_update_book.dart';
import 'package:library_app/usecase/usecase_update_person.dart';

import '../../entities/validator.dart';

/// this provider calls all the UseCases
class MainProvider extends ChangeNotifier{
  MainProvider(this.bookRepo, this.personRepo);

  /// repositories needed to be passed to the usecases
  final BookRepository bookRepo;
  final PersonRepository personRepo;

  final searchController = TextEditingController();


  /// this is the person list, everytime there is an update this list is
  /// reloaded
  List<Person> personsCollection = [];

  /// this is the book suggestion list, used in the book searches
  List<Book> bookSuggestionsList = [];

  /// this is the person suggestions list used in the person searches
  List<Person> personSuggestionsList = [];

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

  /// search_collection by book title usecase
  Future<void> searchByTitleOnCollection(String query) async {
    bookSuggestionsList = await searchCollectionByBookTitleUseCase(bookRepo, query);
    notifyListeners();
  }
  
  /// search_collection by book gender usecase
  Future<List<Book>> searchByGenderOnCollection(String query) async{
    return await searchCollectionByGenderUseCase(bookRepo, query);
  }


  /// search_person usecase
  Future<List<Person>> searchPerson(String query) async{
    return searchPersonUseCase(personsCollection, query);
  }

  /// get_persons usecase and updates the list
  Future<void> getPersons() async{
    final personsList = await getPersonsUseCase(personRepo);
    for(var person in personsList){
      final exists = personsList.any((b)=> b.name == person.name);
      if(!exists){
        personsCollection.add(person);
      }
    }

    notifyListeners();
  }

  /// update_book usecase
  Future<Validator> updateBook(
      String title, String author, String gender, int amount
  ) async{
    final book = Book(
        title: title, author: author,
        gender: gender, amount: amount
    );

    return updateBookUseCase(bookRepo, book);
  }

  /// update_Person usecase
  Future<Validator> updatePerson(String name, int age) async{
    Person person = Person(name, age);
    return updatePersonUseCase(personRepo, person);
  }


  /// delete_book usecase
  Future<Validator> deleteBook(Book book) async{
    return deleteBookUseCase(bookRepo, book);
  }

  /// delete_person usecase
  Future<Validator> deletePerson(Person person) async{
    return deletePersonUseCase(personRepo, person);
  }

  /// insert_book usecase
  Future<Validator> insertBook(
    String title, String author, String gender, int amount
    ) async{

    // creating a book entity to pass to the usecase
    Book book = Book(
      title: title,
      author: author,
      gender: gender,
      amount: amount
    );

    return insertBookUseCase(bookRepo, book);
  }
  /// insert_person usecase
  Future<Validator> insertPerson(String name, int age) async{
    Person person = Person(name, age);
    return insertPersonUseCase(personRepo, person);
  }

}