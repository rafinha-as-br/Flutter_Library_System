import 'package:flutter/material.dart';

/// this dialog is called when there is any error while calling the docker
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          /// header
          Row(
            children: [
              Icon(Icons.not_interested),
              Text('Erro!')
            ],
          ),
          Divider(),

          /// Body
          Center(child: Text(message),)
        ],
      ),
    );
  }
}
