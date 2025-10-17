
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';



class BookImpl implements BookRepository{

  @override
  Future<List<Book>> searchAllBooks() async{
    final url = Uri.parse('http://10.0.2.2:8000/livro');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Convert each json into a Book
      books = data.map((json) => Book.fromJson(json)).toList();
    }

    return books;
  }

  /// this function is not currently working
  @override
  Future<List<dynamic>> getGendersAvailable() async {
    final url = Uri.parse('http://10.0.2.2:8000/livro/disponiveis');
    final response = await http.get(url);

    final List<dynamic> json;
    if (response.statusCode == 200) {
      return json = jsonDecode(response.body);
    }

    return [];
  }

  @override
  Future<Validator> insertBook(Book book) async{

    try {
      final url = Uri.parse('http://10.0.2.2:8000/livro');

      final response = await http.post(
          url,
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id' : book.id,
            'titulo' : book.title,
            'autor' : book.author,
            'genero' : book.gender,
            'exemplares' : book.amount,
            'emprestimos' : []
          })
      );

      if (response.statusCode == 201) {
        return Validator(true, null);

      } else {

        final Map<String, dynamic> errorBody = jsonDecode(response.body);

        String errorMessage = 'Erro desconhecido. Status Code: ${response.statusCode}';

        if (errorBody.containsKey('erro')) {
          errorMessage = errorBody['erro'];
        } else if (errorBody.containsKey('error')) {
          errorMessage = errorBody['error'];
        }

        return Validator(false, errorMessage);
      }

    } on Exception catch (e) {
      return Validator(false, 'Erro de conexão ou requisição: ${e.toString()}');
    }
  }

  @override
  Future<Validator> removeBook(Book book) async{
    try {
      final url = Uri.parse('http://10.0.2.2:8000/livro/${book.id}');
      await http.delete(url);
    } on Exception catch (e) {
      return Validator(false, e.toString());
    }

    return Validator(true, null);
  }

  @override
  Future<List<Book>> searchBooksByAuthor(String author) async {
    final url = Uri.parse('http://10.0.2.2:8000/livro?autor=$author');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if(data == null) return [];
      // Convert each json into a Book
      for(var json in data) {
        books.add(Book.fromJson(json));
      }

    }

    return books;
  }

  @override
  Future<List<Book>> searchBooksByGender(String gender) async{
    final url = Uri.parse('http://10.0.2.2:8000/livro?genero=$gender');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if(data == null) return [];
      // Convert each json into a Book
      for(var json in data) {
        books.add(Book.fromJson(json));
      }
    }

    return books;
  }

  @override
  Future<List<Book>> searchBooksByTitle(String title) async{
    final url = Uri.parse('http://10.0.2.2:8000/livro?titulo=$title');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if(data == null) return [];
      // Convert each json into a Book
      for(var json in data) {
        books.add(Book.fromJson(json));
      }
    }

    return books;
  }

  @override
  Future<Validator> updateBook(Book book) async{
    try {
      final url = Uri.parse('http://10.0.2.2:8000/livro/${book.id}');

      final response = await http.put(
          url,
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id' : book.id,
            'titulo' : book.title,
            'autor' : book.author,
            'genero' : book.gender,
            'exemplares' : book.amount,
          })
      );

      if (response.statusCode == 200) {
        return Validator(true, null);

      } else {

        final Map<String, dynamic> errorBody = jsonDecode(response.body);

        String errorMessage = 'Erro desconhecido. Status Code: ${response.statusCode}';

        if (errorBody.containsKey('erro')) {
          errorMessage = errorBody['erro'];
        } else if (errorBody.containsKey('error')) {
          errorMessage = errorBody['error'];
        }

        return Validator(false, errorMessage);
      }

    } on Exception catch (e) {
      return Validator(false, 'Erro de conexão ou requisição: ${e.toString()}');
    }
  }

  @override
  Future<List<Book>> getLendings() async{
    final url = Uri.parse('http://10.0.2.2:8000/livro/emprestados');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    }

    return [];
  }

  @override
  Future<Validator> lendBook(Book book, String personName) async{
    try {
      final url = Uri.parse('http://10.0.2.2:8000/livro/emprestimo/${book.id}');
      final response = await http.put(
          url,
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "nome_amiguinho" : personName
          })
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(responseBody['message']);
        return Validator(true, responseBody['message']);

      } else {
        return Validator(false, 'Campo nome vazio');
      }
    } on Exception catch (e) {
      return Validator(false, e.toString());
    }

  }

  @override
  Future<Validator> returnLend(Book book, String personName) async{
    try {
      final url = Uri.parse('http://10.0.2.2:8000/livro/devolver/${book.id}');
      final response = await http.patch(
          url,
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "nome_amiguinho" : personName
          })
      );

      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        
        return Validator(true, responseBody['message']);

      } else {
        return Validator(false, responseBody['error']);
      }
    } on Exception catch (e) {
      return Validator(false, e.toString());
    }
  }



}