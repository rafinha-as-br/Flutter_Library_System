import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_alert.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_error.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_sucess.dart';
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

                        mainProvider.setBookForEdit(book);

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


                            return CustomAlertDialog(
                                onContinue: () async{
                                  final status = await mainProvider.deleteBook(book);
                                  if(status.status && context.mounted){
                                    Navigator.of(context).pop();
                                    showDialog(context: context, builder: (context){
                                      return SucessDialog(sucessMessage: "Sucesso ao deletar o livro!");
                                    });
                                    mainProvider.togglePage(0);
                                  } else{

                                    return showDialog(
                                        context: context,
                                        builder: (context){
                                          return ErrorDialog(message: status.msg!);
                                        }
                                    );
                                  }
                            });
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

/// this card shows a book without edit and delete buttons, but still has onTap action
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

/// This card shows a book without any action
class BookCardC extends StatelessWidget {
  const BookCardC({
    super.key,
    required this.book,

  });
  final Book book;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
        )
      ),
    );
  }
}
