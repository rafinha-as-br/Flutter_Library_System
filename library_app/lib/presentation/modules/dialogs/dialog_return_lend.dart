import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';

import '../../../entities/validator.dart';
import '../cards/card_book.dart';
import 'dialog_error.dart';
import 'dialog_models.dart';
import 'dialog_sucess.dart';

typedef LendDialogCallBack = Future<Validator> Function(String personName);

/// this dialog is called to return a lend from a specific book
class ReturnLendDialog extends StatelessWidget {
  const ReturnLendDialog({
    super.key,
    required this.confirmAction,
    required this.cancelAction,
    required this.book
  });

  final LendDialogCallBack confirmAction;
  final VoidCallback cancelAction;
  final Book book;


  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return DialogModel1(
        header: [
          Icon(Icons.call_to_action_outlined, size: 35,),
          Text('Devolvendo empréstimo', style: Theme.of(context).textTheme.titleLarge,),
        ],
        body: Column(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Livro selecionado:', style: Theme.of(context).textTheme.titleMedium,),
                BookCardC(book: book)
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Text('Nome da pessoa para devolver:', style: Theme.of(context).textTheme.titleMedium,),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hint: Text('Nome'),
                      border: OutlineInputBorder()
                  ),
                ),
              ],
            )
          ],
        ),
        footer: [

          // cancel button
          ElevatedButton(
              onPressed: cancelAction,

              child: Text('Cancelar')
          ),

          // confirm button
          ElevatedButton(
              onPressed: () async{
                final lendBook = await confirmAction(controller.text);
                if(!lendBook.status && context.mounted) {
                  showDialog(context: context, builder: ( context){
                    return ErrorDialog(message: lendBook.msg!);
                  });
                } else if(context.mounted){
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context){
                        return SucessDialog(sucessMessage: lendBook.msg!);
                      });
                }

              },
              child: Text('Continuar')
          ),
        ]
    );
  }
}
