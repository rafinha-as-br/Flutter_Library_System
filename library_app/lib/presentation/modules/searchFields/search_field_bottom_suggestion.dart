import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';
import '../cards/card_book.dart';
import '../dialogs/dialog_do_lend.dart';
/// this searchField shows a book suggestions list above the searchField
class BottomSuggestionSearchFieldA extends StatelessWidget {
   const BottomSuggestionSearchFieldA({
    super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Column(
      children: [
        SearchBar(
          hintText: 'Buscar livro',
          controller: mainProvider.searchController,
          leading: const Icon(Icons.search),
          trailing: [
            if(mainProvider.searchController.text.isNotEmpty)
              IconButton(
                  onPressed: (){
                    mainProvider.searchController.clear();
                    mainProvider.clearBookSuggestionsList();
                  },
                  icon: Icon(Icons.clear)
              )
          ],
          onChanged: (query) => mainProvider.searchBooks(query),
        ),
        if(mainProvider.bookSuggestionsList.isEmpty)
          Column(
            children: [
              SizedBox(height: 110,),
              Icon(
                Icons.menu_book_outlined,
                size: 120,
              ),
              SizedBox(height: 15,),
              Text(
                'Busque um livro por título, autor ou gênero!',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ],
          ),
        if(mainProvider.bookSuggestionsList.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: mainProvider.bookSuggestionsList.length,
            itemBuilder: (context, index){
              final book = mainProvider.bookSuggestionsList[index];
              return BookCardA(book: book, onTap: onTap,);
            },
          )
      ],
    );
  }
}

class BottomSuggestionSearchFieldB extends StatelessWidget {
   const BottomSuggestionSearchFieldB({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Column(
      children: [
        SearchBar(
          hintText: 'Buscar livro',
          controller: mainProvider.searchController,
          leading: const Icon(Icons.search),
          trailing: [
            if(mainProvider.searchController.text.isNotEmpty)
              IconButton(
                  onPressed: (){
                    mainProvider.searchController.clear();
                    mainProvider.clearBookSuggestionsList();
                  },
                  icon: Icon(Icons.clear)
              )
          ],
          onChanged: (query) => mainProvider.searchBooks(query),
        ),
        if(mainProvider.bookSuggestionsList.isEmpty)
          Column(
            children: [
              SizedBox(height: 110,),
              Icon(
                Icons.menu_book_outlined,
                size: 120,
              ),
              SizedBox(height: 15,),
              Text(
                'Busque um livro por título, autor ou gênero!',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ],
          ),
        if(mainProvider.bookSuggestionsList.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: mainProvider.bookSuggestionsList.length,
            itemBuilder: (context, index){
              final book = mainProvider.bookSuggestionsList[index];
              return BookCardB(book: book, onTap: (){
                mainProvider.editableBook = book;
                showDialog(
                    context: context,
                    builder: (context) {
                      return LendDialog(
                          book: mainProvider.editableBook!,
                          confirmAction: mainProvider.lendBook,
                          cancelAction: (){
                            Navigator.of(context).pop();
                          }
                      );
                    }
                );
              },);
            },
          )
      ],
    );
  }
}
