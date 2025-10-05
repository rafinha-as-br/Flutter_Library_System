import 'package:library_app/entities/book.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase search all the books that EXISTS in the collection,
/// searching by title, author and gender

Future<List<Book>> searchBooksUseCase(
    BookRepository bookRepo, String query
    ) async
{

  if(query.trim().isEmpty) return [];

  final titleResults = await bookRepo.searchBooksByTitle(query);
  final authorResults = await bookRepo.searchBooksByAuthor(query);
  final genderResults = await bookRepo.searchBooksByGender(query);

  /// combine results and remove duplicates
  final combined = [...titleResults, ...authorResults, ...genderResults];
  final finalList = <dynamic, Book>{};
  for (var book in combined) {
    finalList.putIfAbsent(book.id, () => book);
  }

  return finalList.values.toList();
}

