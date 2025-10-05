
import 'package:library_app/entities/validator.dart';

import '../entities/person.dart';

abstract class PersonRepository{

  /// to get all persons in collection
  Future<List<Person>> getPersons();

  ///to insert an person
  Future<Validator> insertPerson(Person person);

  /// to update an person
  Future<Person> updatePerson(Person person);

  /// to remove an person
  Future<Validator> removePerson(Person person);
}