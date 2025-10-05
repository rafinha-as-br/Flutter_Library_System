import 'package:library_app/entities/validator.dart';

/// this is the book entity, contains all the params to a book
class Book {
  String? id;
  final String title;
  final String author;
  final String gender;
  final int amount;

  Book({
    required this.title,
    required this.author,
    required this.gender,
    required this.amount,
  });

  /// validate function that validates itself
  Validator validate(){
    if(this.title.isEmpty) return Validator(false, 'O livro está sem título!');
    if(this.author.isEmpty) return Validator(false, 'O livro precisa de um autor!');
    if(this.gender.isEmpty) return Validator(false, 'O livro precisa conter ao menos um gênero!');
    return Validator(true, null);
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json["titulo"] ?? "",
      author: json["autor"] ?? "",
      gender: json["genero"] ?? "",
      amount: json["quantidade"] ?? 0,
    ).. id = json["_id"] ?? "";

  }
}
