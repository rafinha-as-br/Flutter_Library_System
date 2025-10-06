import '../entities/book.dart';

/// this usecase searches books by title inside the available collection
List<Book> searchCollectionByBookTitleUseCase(
    List<Book> collection, String query
) {
  if(query.isEmpty) return [];
  return collection.where((book) =>
      book.title.toLowerCase().contains(query.toLowerCase())).toList();
}

/// this usecase searches books by gender inside the available collection
List<Book> searchCollectionByGenderUseCase(
  List<Book> collection, String query
){
  if(query.isEmpty) return [];
  return collection.where((book) => book.gender.toLowerCase().contains(query.toLowerCase())).toList();
}
