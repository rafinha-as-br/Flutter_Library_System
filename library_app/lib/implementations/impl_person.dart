
import 'package:library_app/entities/person.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_person.dart';

class PersonImpl implements PersonRepository{
  @override
  Future<List<Person>> getPersons() {
    // TODO: implement getPersons
    throw UnimplementedError();
  }

  @override
  Future<Validator> insertPerson(Person person) {
    // TODO: implement insertPerson
    throw UnimplementedError();
  }

  @override
  Future<Validator> removePerson(Person person) {
    // TODO: implement removePerson
    throw UnimplementedError();
  }

  @override
  Future<Validator> updatePerson(Person person) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }

}