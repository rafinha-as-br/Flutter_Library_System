import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_models.dart';

/// this dialog is used to alert the user before an import action

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return DialogModel1(
        header: [
          Icon(Icons.notification_important, size: 35,),
          Text('Atenção!', style: Theme.of(context).textTheme.titleLarge,),
        ],
        body: Center(
          child: Text('Esta ação é irreversível! Deseja continuar?'),
        ),
        footer: [
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')
          ),

          ElevatedButton(
              onPressed: onContinue,
              child: Text('Continuar')
          )
        ]
    );
  }
}
