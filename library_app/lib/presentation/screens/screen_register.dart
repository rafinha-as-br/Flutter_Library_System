import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/tabs/tabs_record_book.dart';
import 'package:library_app/presentation/modules/tabs/tabs_person.dart';

/// Register screen that allows the system user to register a new book or user
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TabBar(
              tabs: [
                /// book registration tab
                Tab(
                  icon: Icon(Icons.book),
                  text: 'Registrar livro',
                ),

                /// person registration tab
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Registrar pessoa',
                )
              ]
              ),

            Expanded(

              child: TabBarView(
                children: [
                  RecordBookTab(),
                  PersonTab()

                ]
              )
            )
          ],
        ),
      )
    );
  }
}
