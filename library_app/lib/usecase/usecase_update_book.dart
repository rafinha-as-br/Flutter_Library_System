import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase updates a book on collection
Future<Validator> updateBookUseCase(BookRepository bookRepo, Book book) async{
  return bookRepo.updateBook(book);
}