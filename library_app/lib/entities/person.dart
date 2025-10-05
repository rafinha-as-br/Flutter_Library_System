import 'package:library_app/entities/validator.dart';

/// this is the person entity, contains all the person params
class Person{
  String name;
  int age;

  Person(this.name, this.age);

  Validator validate(){
    if(name.isEmpty) return Validator(false, 'O nome está vazio!');
    if(name.length>3) return Validator(false, 'O nome precisa ter 3 caracteres!');
    if(age<=0) return Validator(false, 'A idade precisa ser uma idade válida!');
    return Validator(true, null);
  }


}