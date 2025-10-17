import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/cards/card_loan.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_main.dart';

class BookLoansTab extends StatelessWidget {
  const BookLoansTab({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 23),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Column(
              children: [
                Text('Lista de empréstimos', style: Theme.of(context).textTheme.displaySmall,),
                Text('Selecione um livro para fazer uma devolução'),
              ],
            ),


            // loans list view
            FutureBuilder(
                future: mainProvider.searchLends(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(),);
                  if(snapshot.data!.isEmpty) return Center(child: Text('Não há empréstimos!'),);

                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        final book = snapshot.data![index];
                        return LoanCard(book: book);
                      }
                    ),
                  );

                }
            ),
          ],
        ),
      ),
    );
  }
}
