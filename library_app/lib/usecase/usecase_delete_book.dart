import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

import '../entities/book.dart';

/// this usecase deletes a book from the collection
Future<Validator> deleteBookUseCase(BookRepository bookRepo, Book book) async{
  return await bookRepo.removeBook(book);
}