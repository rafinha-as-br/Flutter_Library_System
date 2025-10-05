import 'package:library_app/entities/person.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_person.dart';

/// this usecase deletes a person from the collection
Future<Validator> deletePersonUseCase(
  PersonRepository personRepo, Person person
) async {
  return await personRepo.removePerson(person);
}