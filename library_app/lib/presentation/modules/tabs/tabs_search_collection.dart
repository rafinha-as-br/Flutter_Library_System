import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';

/// This tab allows the system user to view the quantity available of books by
/// gender or author (just to show the agreggate method needed)
class SearchCollectionTab extends StatelessWidget {
  const SearchCollectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Column(
      children: [
        Text('Pesquisando acervo'),
        SearchAnchor.bar(
            barHintText: 'Pesquisar',

            onChanged: mainProvider.searchBooks,

            suggestionsBuilder: (context, controller){
              final results = mainProvider.suggestionsList;

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
                  title: Text(book),
                  onTap: (){
                    controller.closeView(book);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Livro selecionado: $book'))
                    );
                  },
                );
              });

            }
        )
      ],
    );
  }
}
