
import 'package:flutter/cupertino.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/person.dart';
import 'package:library_app/repositories/repository_book.dart';
import 'package:library_app/repositories/repository_person.dart';
import 'package:library_app/usecase/usecase_get_collection.dart';
import 'package:library_app/usecase/usecase_get_persons.dart';
import 'package:library_app/usecase/usecase_insert_book.dart';
import 'package:library_app/usecase/usecase_insert_person.dart';
import 'package:library_app/usecase/usecase_search_books.dart';
import 'package:library_app/usecase/usecase_search_collection.dart';
import 'package:library_app/usecase/usecase_search_person.dart';

import '../../entities/validator.dart';

/// this provider calls all the UseCases
class MainProvider extends ChangeNotifier{
  MainProvider(this.bookRepo, this.personRepo);

  /// repositories needed to be passed to the usecases
  final BookRepository bookRepo;
  final PersonRepository personRepo;

  /// this is the collection list, everytime there is an update this list is
  /// reloaded
  List<Book> bookCollection = [];

  /// this is the person list, everytime there is an update this list is
  /// reloaded
  List<Person> personsCollection = [];


  List<Book> bookSuggestionsList = [];
  List<Person> personSuggestionsList = [];

  void clearBookSuggestionsList(){
    bookSuggestionsList = [];
    notifyListeners();
  }

  /// search_books usecase
  Future<List<Book>> searchBooks(String query) async{
    return searchBooksUseCase(bookRepo, query);
  }

  /// search_collection usecase
  List<Book> searchCollection(String query) {
    return searchCollectionUseCase(bookCollection, query);
  }

  /// get_collection usecase and updates the list
  Future<void> getCollection() async{
    final books = await getCollectionUseCase(bookRepo);
    for (var book in books) {
      final exists = bookCollection.any((b) => b.id == book.id);
      if (!exists) {
        bookCollection.add(book);
      }
    }

    notifyListeners();
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
  /// update_Person usecase


  /// delete_book usecase
  /// delete_person usecase


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