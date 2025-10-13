import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';
import '../cards/card_book.dart';
/// this searchField shows a book suggestions list above the searchField
class BottomSuggestionSearchField extends StatelessWidget {
   BottomSuggestionSearchField({
    super.key, required this.onTap, required this.searchController});
  final VoidCallback onTap;
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Column(
      children: [
        SearchBar(
          hintText: 'Buscar livro',
          controller: searchController,
          leading: const Icon(Icons.search),
          trailing: [
            if(searchController.text.isNotEmpty)
              IconButton(
                  onPressed: (){
                    searchController.clear();
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
              return BookCard(book: book, onTap: onTap,);
            },
          )
      ],
    );
  }
}
