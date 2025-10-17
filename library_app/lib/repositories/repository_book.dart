
import 'dart:async';

import 'package:library_app/entities/book.dart';

import '../entities/validator.dart';

abstract class BookRepository{

  /// to search all books in the collection
  Future<List<Book>> searchAllBooks();

  ///to search books by author
  Future<List<Book>> searchBooksByAuthor(String author);

  /// to search books by gender
  Future<List<Book>> searchBooksByGender(String gender);

  /// to search books by title
  Future<List<Book>> searchBooksByTitle(String title);

  /// to get all books available on the collection
  Future<List<dynamic>> getGendersAvailable();

  /// to get all books that have a lend
  Future<List<Book>> getLendings();

  ///to add a new book
  Future<Validator> insertBook(Book book);

  ///to remove a book
  Future<Validator> removeBook(Book book);

  ///to update a book
  Future<Validator> updateBook(Book book);

  ///to do a lend
  Future<Validator> lendBook(Book book, String personName);

  ///to return a book
  Future<Validator> returnLend(Book book, String personName);

}