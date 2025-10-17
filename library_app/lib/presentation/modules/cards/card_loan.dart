import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_return_lend.dart';
import 'package:provider/provider.dart';

import '../../../entities/validator.dart';
import '../../providers/provider_main.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({super.key, required this.book});

  final Book book;


  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    String lends = '';
    for (var lend in book.loans) {
      lends += '$lend, ';
    }


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: (){
            mainProvider.editableBook = book;

            showDialog(
                context: context,
                builder: (context) {
                  return ReturnLendDialog(
                      confirmAction: mainProvider.returnLend,
                      cancelAction: (){Navigator.of(context).pop();},
                      book: book
                  );
                });
          },
          child: Row(
            children: [
              Icon(Icons.book, size: 100,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.title, style: Theme.of(context).textTheme.bodyLarge,),

                      lends.isEmpty ?
                      Text('Não há empréstimos')
                          :
                      Text('Empréstimos: $lends')
                    ],
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}
