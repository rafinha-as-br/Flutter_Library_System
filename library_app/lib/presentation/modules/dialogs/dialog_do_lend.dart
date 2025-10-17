import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/presentation/modules/cards/card_book.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_error.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_models.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_sucess.dart';

// function that receives a controller to be passed to the function
typedef LendDialogCallBack = Future<Validator> Function(String personName);

/// this dialog is called to do a lend, calling the
class LendDialog extends StatelessWidget {
  const LendDialog({
    super.key, required this.confirmAction, required this.cancelAction,
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
          Text('Fazendo um empréstimo', style: Theme.of(context).textTheme.titleLarge,),
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
                Text('Nome da pessoa:', style: Theme.of(context).textTheme.titleMedium,),
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
