import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_models.dart';

/// this dialog is called when there is any error while calling the docker
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return DialogModel1(
        header: [
          Icon(Icons.not_interested, size: 35,),
          Text('Erro!', style: Theme.of(context).textTheme.displayLarge,)
        ],
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.titleLarge,)
          ],
        ),
        footer: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Entendi!'))
        ]
    );
  }
}
