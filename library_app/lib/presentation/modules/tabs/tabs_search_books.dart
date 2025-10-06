import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/cards/card_book.dart';
import 'package:library_app/presentation/providers/provider_main.dart';
import 'package:provider/provider.dart';

/// this tab allow the system user to search by title, gender and author
/// any books that exists in  the database,
/// it can be or not available in the collection
class SearchBookTab extends StatelessWidget {
  const SearchBookTab({super.key});


  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final searchController = TextEditingController();

    ///clear the suggestions list to every time that tab is reopened

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                return BookCard(book: book);
              },
            )
        ],
      ),
    );
  }
}
