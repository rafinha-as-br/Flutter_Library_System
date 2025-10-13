import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/searchFields/search_field_bottom_suggestion.dart';

/// this tab contains the form to do a book lending
class LendBookTab extends StatelessWidget {
  const LendBookTab({super.key});




  @override
  Widget build(BuildContext context) {

    final searchController = TextEditingController();


    return Column(
      children: [

        Text(
            'Emprestando um livro',
          style: Theme.of(context).textTheme.displaySmall,
        ),

        // get the book
        BottomSuggestionSearchField(
          onTap: (){
            },
          searchController: searchController,
        ),



        // get the person
      ],
    );
  }
}
