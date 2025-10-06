import 'package:library_app/entities/person.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_person.dart';

class PersonImplTesting implements PersonRepository {
  final List<Person> _persons = [
    Person('Ana', 25),
    Person('Bruno', 31),
    Person('Carla', 28),
    Person('Diego', 22),
  ];

  @override
  Future<List<Person>> getPersons() async {
    await Future.delayed(const Duration(milliseconds: 300)); // simula latência
    return _persons;
  }

  @override
  Future<Validator> insertPerson(Person person) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final exists = _persons.any((p) => p.name.toLowerCase() == person.name.toLowerCase());
    if (exists) {
      return Validator(false, 'Pessoa já cadastrada.');
    }
    _persons.add(person);
    return Validator(true, 'Pessoa adicionada com sucesso.');
  }

  @override
  Future<Validator> removePerson(Person person) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _persons.indexWhere((p) => p.name.toLowerCase() == person.name.toLowerCase());
    if (index != -1) {
      _persons.removeAt(index);
      return Validator(true, 'Pessoa removida com sucesso.');
    } else {
      return Validator(false, 'Pessoa não encontrada.');
    }
  }


  @override
  Future<Validator> updatePerson(Person person) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _persons.indexWhere((p) => p.name == person.name);
    if (index != -1) {
      _persons[index] = person;
      return Validator(true, 'Pessoa atualizada com sucesso.');
    } else {
      return Validator(false, 'Pessoa não encontrada.');
    }
  }
}
