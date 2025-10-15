import 'package:library_app/repositories/repository_book.dart';

import '../entities/book.dart';

/// this usecase gets a dynamic list from bookRepo and transforms to a map
Future<Map<String, int>> getGendersAvailables(BookRepository bookRepo) async{

  final genderList = await bookRepo.getGendersAvailable();

  final Map<String, int> genderMap = {};

  for(var item in genderList){
    genderMap[item['genero']] = item['totalLivros'];
  }

  return genderMap;
}