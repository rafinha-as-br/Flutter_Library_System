
import 'package:flutter/cupertino.dart';

/// this provider calls all the UseCases
class MainProvider extends ChangeNotifier{

  final searchController = TextEditingController();


  final List<String> books = [
    'Livro A',
    'Livro G',
    'Livro H',
    'Pedra',
    'Papel',
    'Tesoura'

  ];

  List<String> suggestionsList = [];

  void clearResults(){
    suggestionsList = [];
    notifyListeners();
  }

  void searchBooks(String query) {
    searchController.text = query;
    if (query.isEmpty) {
      suggestionsList = [];
    } else {
      suggestionsList = books
          .where((book) => book.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }


}