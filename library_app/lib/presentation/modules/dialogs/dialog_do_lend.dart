import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/entities/validator.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_error.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_models.dart';

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
          Icon(Icons.call_to_action_outlined),
          Text('Fazendo um empréstimo'),
        ],
        body: Column(
          children: [
            Text('Nome da pessoa:'),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hint: Text('Nome'),
                border: OutlineInputBorder()
              ),
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
                }

              },
              child: Text('Fazer empréstimo')
          ),
        ]
    );
  }
}
