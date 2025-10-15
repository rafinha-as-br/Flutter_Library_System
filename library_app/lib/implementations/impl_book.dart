
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';



class BookImpl implements BookRepository{

  @override
  Future<List<Book>> searchAllBooks() async{
    final url = Uri.parse('http://localhost:8000/livro');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Convert each json into a Book
      books = data.map((json) => Book.fromJson(json)).toList();
    }

    return books;
  }

  @override
  Future<List<dynamic>> getCollectionBooks() async {
    final url = Uri.parse('http://10.0.2.2:8000/livro/disponiveis');
    final response = await http.get(url);

    final List<dynamic> json;
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);

    }

    return [];
  }

  @override
  Future<Validator> insertBook(Book book) {
    // TODO: implement insertBook
    throw UnimplementedError();
  }

  @override
  Future<Validator> removeBook(Book book) {
    // TODO: implement removeBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> searchBooksByAuthor(String author) async {
    final url = Uri.parse('http://localhost:8000/livro?autor=$author');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Convert each json into a Book
      books = data.map((json) => Book.fromJson(json)).toList();
    }

    return books;
  }

  @override
  Future<List<Book>> searchBooksByGender(String gender) async{
    final url = Uri.parse('http://localhost:8000/livro?genero=$gender');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Convert each json into a Book
      books = data.map((json) => Book.fromJson(json)).toList();
    }

    return books;
  }

  @override
  Future<List<Book>> searchBooksByTitle(String title) async{
    final url = Uri.parse('http://localhost:8000/livro?titulo=$title');
    final response = await http.get(url);

    List<Book> books = [];

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Convert each json into a Book
      books = data.map((json) => Book.fromJson(json)).toList();
    }

    return books;
  }

  @override
  Future<Validator> updateBook(Book book) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }


}