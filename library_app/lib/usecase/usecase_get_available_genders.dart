import 'package:library_app/repositories/repository_book.dart';

import '../entities/book.dart';

/// this usecase gets a dynamic list from bookRepo and transforms to a map
Future<Map<String, int>> getGendersAvailables(BookRepository bookRepo) async{

  final allBooks = await bookRepo.searchAllBooks();

  final Map<String, int> genderMap = {};

  /// get the list of

  for(var book in allBooks){
    final genre = book.gender;
    if(genderMap.containsKey(genre)) {
      genderMap[genre] = genderMap[genre]! + 1;
    } else genderMap[genre] = 1;
  }

  return genderMap;
}