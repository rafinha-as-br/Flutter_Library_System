import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase inserts a book on the collection

Future<Validator> insertBookUseCase(BookRepository bookRepo,Book book) async{
  final validate = book.validate();
  if(!validate.status) return validate; /// returns the validator with msg to be shown

  final insert = await bookRepo.insertBook(book);
  if(!insert.status) return insert; /// returns the validator with msg to be shown

  return Validator(true, null);

}