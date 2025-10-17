import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';

/// this card shows a book with edit and delete buttons
class BookCardA extends StatelessWidget {
  const BookCardA({
    super.key,
    required this.book,
    required this.onTap,
  });
  final Book book;


  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Row(
            spacing: 2,
            children: [
              Icon(
                Icons.book,
                size: 100,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title, style: Theme.of(context).textTheme.bodyLarge,),
                    Text('${book.author} - ${book.gender}')
                  ],
                ),
              ),

              Row(
                spacing: 2,
                children: [

                  /// edit book button
                  IconButton(
                      onPressed: (){
                        mainProvider.setEditableBook(book);

                      },
                      icon: Icon(
                        Icons.edit,
                        size: 35,
                      )
                  ),

                  /// delete book button
                  IconButton(
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erro!'),
                              content: Text('Desja mesmo excluir o livro? Essa ação é irreversível!'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Continuar'),
                                  onPressed: () {
                                    mainProvider.deleteBook(book);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                        size: 35,
                      )
                  )

                ],
              ),

            ],
          ),
        )
      ),
    );
  }
}
class BookCardB extends StatelessWidget {
  const BookCardB({
    super.key,
    required this.book,
    required this.onTap,
  });
  final Book book;


  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Row(
            spacing: 2,
            children: [
              Icon(
                Icons.book,
                size: 100,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title, style: Theme.of(context).textTheme.bodyLarge,),
                    Text('${book.author} - ${book.gender}')
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
