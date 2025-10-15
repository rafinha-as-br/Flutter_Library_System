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


    return FutureBuilder(
        future: mainProvider.searchByGenderOnCollection(genderName),
        builder: (context, snapshot){
          List<Book> books = [];

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasData){
            books = snapshot.data!;
          }

          if(snapshot.hasError){
            return Center(child: Text('Error'),);
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(genderName, style: Theme.of(context).textTheme.displaySmall,),
            ),
            body: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index){
                  final book = books[index];
                  return BookCard(book: book, onTap: (){},);
                }
            ),
          );
        }
    );
  }
}
