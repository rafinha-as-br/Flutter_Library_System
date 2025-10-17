import 'package:flutter/material.dart';

/// this file contains custom structure models of dialogs


/// model 1: Simple header, body and Footer
class DialogModel1 extends StatelessWidget {
  /// model 1: Dialog with simple header, body and footer
  ///
  /// Dialog:
  ///   -> Header:
  ///       - icon
  ///       - title
  ///       - Subtitle
  ///
  ///    *Divider()
  ///   -> Body:
  ///       - widget
  ///
  ///   -> Footer:
  ///       - List of buttons
  const DialogModel1({super.key, required this.header, required this.body, required this.footer});

  final List<Widget> header;
  final List<ElevatedButton> footer;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [

          //header
          Row(
            children: header
          ),


          // body
          body,

          // footer
          Row(
            children: footer.map((button) {
              return Expanded(child: button);
            }).toList()
          )

        ],
      ),
    );
  }
}
