import 'package:flutter/material.dart';
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


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    mainProvider.clearResults();
                  },
                  icon: Icon(Icons.clear)
                )
            ],
            onChanged: (query) => mainProvider.searchBooks(query),
          ),
          if(mainProvider.suggestionsList.isEmpty)
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
          if(mainProvider.suggestionsList.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: mainProvider.suggestionsList.length,
              itemBuilder: (context, index){
                final book = mainProvider.suggestionsList[index];
                return ListTile(
                  title: Text(book),
                  onTap: (){
                    mainProvider.clearResults();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selecionou: $book'))
                    );
                  },
                );
              },
            )
        ],
      ),
    );
  }
}
