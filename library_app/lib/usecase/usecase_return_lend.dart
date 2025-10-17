import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase calls the return lend repository funcion
Future<Validator> returnLendUseCase(BookRepository bookRepo, Book book, String personName) async{
  return await bookRepo.returnLend(book, personName);
}