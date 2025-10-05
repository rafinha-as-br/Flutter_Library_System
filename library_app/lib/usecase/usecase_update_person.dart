import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_person.dart';

import '../entities/person.dart';

/// this usecase updates a person on the collection
Future<Validator> updatePersonUseCase(
    PersonRepository personRepo, Person person
  ) async{
  return personRepo.updatePerson(person);
}