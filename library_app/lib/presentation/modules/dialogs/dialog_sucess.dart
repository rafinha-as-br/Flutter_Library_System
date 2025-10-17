import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/dialogs/dialog_models.dart';


/// this dialog is called when any USECASE action is succeeded
class SucessDialog extends StatelessWidget {
  const SucessDialog({super.key, required this.sucessMessage});
  final String sucessMessage;

  @override
  Widget build(BuildContext context) {
    return DialogModel1(
        header: [
          Icon(Icons.check_box_outlined, size: 30,),
          Text('Tudo certo!'),
        ],
        body: Center(
          child: Text(sucessMessage),
        ),
        footer: [ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Ok')
        )]
    );
  }
}
