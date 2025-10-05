import 'package:library_app/entities/person.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_person.dart';

/// this usecase inserts a person on the collection

Future<Validator> insertPersonUseCase(
  PersonRepository personRepo, Person person
) async{
  final validate = person.validate();
  if(!validate.status) return validate;

  final insert = await personRepo.insertPerson(person);
  if(!insert.status) return insert;

  return Validator(true, null);
}