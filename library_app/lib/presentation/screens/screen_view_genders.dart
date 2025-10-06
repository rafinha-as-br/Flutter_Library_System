import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/cards/card_book.dart';
import 'package:provider/provider.dart';

import '../../entities/book.dart';
import '../providers/provider_main.dart';

/// this screen show a list of books based on a searched gender inside
/// the collection

class ViewGendersScreen extends StatelessWidget {
  const ViewGendersScreen({super.key, required this.genderName});
  final String genderName;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    final List<Book> books = mainProvider.searchByGenderOnCollection(genderName);

    return Scaffold(
      appBar: AppBar(
        title: Text(genderName, style: Theme.of(context).textTheme.displaySmall,),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index){
          final book = books[index];
          return BookCard(book: book,);
          }
      ),
    );
  }
}
