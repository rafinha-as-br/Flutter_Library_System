
import 'dart:async';

import 'package:library_app/entities/book.dart';

import '../entities/validator.dart';

abstract class BookRepository{

  ///to search books by author
  Future<List<Book>> searchBooksByAuthor(String author);

  /// to search books by gender
  Future<List<Book>> searchBooksByGender(String gender);

  /// to search books by title
  Future<List<Book>> searchBooksByTitle(String title);

  /// to get all books available on the collection
  Future<List<Book>> getCollectionBooks();

  ///to add a new book
  Future<Validator> insertBook(Book book);

  ///to remove a book
  Future<Validator> removeBook(Book book);

  ///to update a book
  Future<Book> updateBook(Book book);


}