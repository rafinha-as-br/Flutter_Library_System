import 'package:library_app/repositories/repository_book.dart';

import '../entities/book.dart';

/// this usecase searches books by title inside the available collection
Future<List<Book>> searchCollectionByBookTitleUseCase(
    BookRepository bookRepo, String query
  ) async{

  return await bookRepo.searchBooksByTitle(query);

}

/// this usecase searches books by gender inside the available collection
Future<List<Book>> searchCollectionByGenderUseCase(
  BookRepository bookRepo, String query
  ) async{
  return bookRepo.searchBooksByGender(query);
}


