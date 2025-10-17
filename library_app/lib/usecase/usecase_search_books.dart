import 'package:library_app/entities/book.dart';
import 'package:library_app/repositories/repository_book.dart';

/// this usecase search all the books that EXISTS in the collection,
/// searching by title, author and gender

Future<List<Book>> searchBooksUseCase(
    BookRepository bookRepo, String query
    ) async
{


  final titleResults = await bookRepo.searchBooksByTitle(query);
  final authorResults = await bookRepo.searchBooksByAuthor(query);

  final genderResults = await bookRepo.searchBooksByGender(query);


  /// combine results and remove duplicates
  final combined = [...titleResults, ...authorResults, ...genderResults];
  final List<Book>finalList = [];

  for (var book in combined) {
    if(!finalList.contains(book)) finalList.add(book);
  }


  return finalList;
}

