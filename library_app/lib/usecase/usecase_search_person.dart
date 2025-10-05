import 'package:library_app/entities/person.dart';

/// this usecase searchs persons by name
List<Person> searchPersonUseCase(
  List<Person> collection, String query
){
  if(query.isEmpty) return [];

  return collection.where((person) =>
    person.name.toLowerCase().contains(query.toLowerCase())).toList();
}