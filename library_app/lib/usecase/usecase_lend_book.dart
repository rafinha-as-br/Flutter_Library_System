
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase adds a name to the loans list
Future<Validator> lendBookUseCase(
    BookRepository bookRepo, Book book, String personName) async
{
  return await bookRepo.lendBook(book, personName);
}