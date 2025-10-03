
import '../entities/person.dart';

abstract class PersonRepository{
  ///to insert an person
  Future<Person> insertPerson(Person person);

  /// to update an person
  Future<Person> updatePerson(Person person);

  /// to remove an person
  Future<Person> removePerson(Person person);
}