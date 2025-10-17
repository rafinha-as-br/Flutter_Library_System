

import 'package:library_app/entities/book.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase calls the getLendings() function from the bookRepo
Future<List<Book>> searchLendsUseCase(BookRepository bookRepo){
  return bookRepo.getLendings();
}
