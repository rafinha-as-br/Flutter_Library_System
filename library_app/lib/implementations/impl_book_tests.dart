
/// this is just for testing with some data
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/repositories/repository_book.dart';

class BookImplTesting implements BookRepository {
  final List<Book> _books = [
    Book(title: '1984', author: 'George Orwell', gender: 'Distopia', amount: 3),
    Book(title: 'O Hobbit', author: 'J.R.R. Tolkien', gender: 'Fantasia', amount: 5),
    Book(title: 'Dom Casmurro', author: 'Machado de Assis', gender: 'Romance', amount: 2),
  ];

  @override
  Future<List<Book>> getGendersAvailable() async {
    await Future.delayed(const Duration(milliseconds: 300)); // simula latência
    return _books;
  }

  @override
  Future<Validator> insertBook(Book book) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _books.add(book);
    return Validator(true, 'Livro adicionado com sucesso.');
  }

  @override
  Future<Validator> removeBook(Book book) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final removed = _books.remove(book);
    return removed
        ? Validator(true, 'Livro removido com sucesso.')
        : Validator(false, 'Livro não encontrado.');
  }

  @override
  Future<Validator> updateBook(Book book) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _books.indexWhere((b) => b.title == book.title);
    if (index != -1) {
      _books[index] = book;
      return Validator(true, 'Livro atualizado com sucesso.');
    } else {
      return Validator(false, 'Livro não encontrado.');
    }
  }

  @override
  Future<List<Book>> searchBooksByTitle(String title) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return _books
        .where((b) => b.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Book>> searchBooksByAuthor(String author) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return _books
        .where((b) => b.author.toLowerCase().contains(author.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Book>> searchBooksByGender(String gender) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return _books
        .where((b) => b.gender.toLowerCase().contains(gender.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Book>> searchAllBooks() {
    // TODO: implement searchAllBooks
    throw UnimplementedError();
  }
}
