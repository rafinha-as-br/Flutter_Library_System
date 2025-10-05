import '../entities/book.dart';

/// this usecase searches inside the available collection
List<Book> searchCollectionUseCase(
    List<Book> collection, String query
) {
  if(query.isEmpty) return [];
  return collection.where((book) =>
      book.title.toLowerCase().contains(query.toLowerCase())).toList();
}