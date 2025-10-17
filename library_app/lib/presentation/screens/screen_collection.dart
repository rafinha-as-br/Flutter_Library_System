import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/tabs/tabs_lend_book.dart';
import 'package:library_app/presentation/modules/tabs/tabs_loans_book.dart';

/// Reserve Screens that allows the system user to lend a book
/// and visualize book loans
class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

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
                    Tab(
                      icon: Icon(Icons.book_outlined),
                      text: 'Emprestar livro',
                    ),
                    Tab(
                      icon: Icon(Icons.format_list_bulleted_rounded),
                      text: 'Empréstimos',
                    )
                  ]
              ),
              Expanded(
                  child: TabBarView(
                      children: [
                        LendBookTab(),
                        BookLoansTab()
                      ]
                  )
              )
            ],
          ),
        )
    );
  }
}
