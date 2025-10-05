
import 'package:library_app/repositories/repository_person.dart';

import '../entities/person.dart';

/// this usecase gets all the persons from the database
Future<List<Person>> getPersonsUseCase(PersonRepository personRepo) async{
  return personRepo.getPersons();
}