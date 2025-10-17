
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase adds a name to the loans list
Future<Validator> lendBookUseCase(
    BookRepository bookRepo, Book book, String personName) async
{
  if(personName.isEmpty) return Validator(false, 'Sem nome para a pessoa');
  // adding the string list of loans the person name
  book.loans.add(personName);

  // removing one book from the amount
  book.amount = book.amount - 1;

  return await bookRepo.updateBook(book);
}