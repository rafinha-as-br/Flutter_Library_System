import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';

/// This tab allows the system user to view the quantity available of books by
/// gender or author (just to show the agreggate method needed)
/// It has a search bar in the final to directly search any book available
class SearchCollectionTab extends StatelessWidget {
  const SearchCollectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    mainProvider.getCollection();

    return Column(
      children: [
        Column(
          children: [
            Text('Pesquisar por um livro dentro do acervo'),
            SearchAnchor.bar(
                barHintText: 'Pesquisar',

                onChanged: mainProvider.searchBooks,

                suggestionsBuilder: (context, controller){
                  final results = mainProvider.bookSuggestionsList;

                  if (results.isEmpty && controller.text.isEmpty) {
                    return const [
                      ListTile(
                        title: Text('Digite algo para pesquisar'),
                      )
                    ];
                  }

                  if (results.isEmpty) {
                    return const [
                      ListTile(
                        title: Text('Nenhum livro encontrado'),
                      )
                    ];
                  }


                  return results.map((book){
                    return ListTile(
                      title: Text(book.title),
                      onTap: (){
                        controller.closeView(book.title);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Livro selecionado: $book'))
                        );
                      },
                    );
                  });

                }
            ),
            Text('Gêneros disponíveis'),
            Container(
              width: 300,
              child: ListView.builder(
                itemCount: mainProvider.bookCollection.length,
                  itemBuilder: (context, index){
                    final book = mainProvider.bookCollection[index];
                    return ListTile(
                      title: Text(book.title),
                    );
                  }
              ),
            )
          ],
        )
      ],
    );
  }
}
