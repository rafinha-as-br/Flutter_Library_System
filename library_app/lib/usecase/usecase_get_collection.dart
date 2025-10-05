import 'package:library_app/repositories/repository_book.dart';

import '../entities/book.dart';

/// this usecase gets all the books AVAILABLE on collection
Future<List<Book>> getCollectionUseCase(BookRepository bookRepo) async{
  return await bookRepo.getCollectionBooks();
}