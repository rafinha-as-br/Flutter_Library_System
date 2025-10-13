import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/cards/card_book.dart';
import 'package:library_app/presentation/modules/cards/card_gender.dart';
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

    /// to update the collection to the most recent
    mainProvider.getCollection();

    final Map<String, int> gendersMap = mainProvider.getGendersMap();


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Column(
        spacing: 15,
        children: [

          // searchfield
          Column(
            spacing: 10,
            children: [
              SearchAnchor.bar(
                  barHintText: 'Pesquisar no acervo',

                  onChanged: mainProvider.searchByTitleOnCollection,

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
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookCard(book: book, onTap: (){},),
                      );
                    });

                  }
              ),
            ],
          ),

          // genders cards list field
          Expanded(
            child: GridView.builder(
              itemCount: gendersMap.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index){
                  final genderName = gendersMap.keys.elementAt(index);
                  final genderAmount = gendersMap[genderName]!;

                  return GenderCard(
                      genderName: genderName,
                      amount: genderAmount
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
