
import 'package:library_app/entities/book.dart';
import 'package:library_app/repositories/repository_book.dart';

class BookImpl implements BookRepository{
  @override
  Future<void> insertBook(Book book) {
    // TODO: implement insertBook
    throw UnimplementedError();
  }

  @override
  Future<void> removeBook(Book book) {
    // TODO: implement removeBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> searchBooksByAuthor(String author) {
    // TODO: implement searchBooksByAuthor
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> searchBooksByGender(String gender) {
    // TODO: implement searchBooksByGender
    throw UnimplementedError();
  }

  @override
  Future<Book> updateBook(Book book) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }

}