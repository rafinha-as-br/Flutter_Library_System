
import 'dart:async';

import 'package:library_app/entities/book.dart';

abstract class BookRepository{

  ///to search books by author
  Future<List<Book>> searchBooksByAuthor(String author);

  /// to search books by gender
  Future<List<Book>> searchBooksByGender(String gender);

  ///to add a new book
  Future<void> insertBook(Book book);

  ///to remove a book
  Future<void> removeBook(Book book);

  ///to update a book
  Future<Book> updateBook(Book book);


}