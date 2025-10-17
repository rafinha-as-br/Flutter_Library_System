
import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_do_lend.dart';
import 'package:library_app/presentation/modules/searchFields/search_field_bottom_suggestion.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';

typedef LendDialogCallBack = void Function(String personName);


/// this tab contains the form to do a book lending
class LendBookTab extends StatelessWidget {
  const LendBookTab({super.key});


  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        spacing: 15,
        children: [

          Text(
              'Emprestando um livro',
            style: Theme.of(context).textTheme.displaySmall,
          ),

          // get the book
          BottomSuggestionSearchFieldB(),



          // get the person
        ],
      ),
    );
  }
}
