import 'package:flutter/material.dart';
import 'package:library_app/presentation/modules/tabs/tabs_search_books.dart';
import 'package:library_app/presentation/modules/tabs/tabs_search_collection.dart';

/// search screen that allows the user to search books
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                  icon: Icon(Icons.search),
                  text: 'Pesquisar livros',
                ),

                  Tab(
                  icon: Icon(Icons.library_books),
                  text: 'Procurar no acervo',
                )
                ]
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    SearchBookTab(),
                    SearchCollectionTab()
                  ]
                )
              )
            ],
          ),
        )
    );
  }
}
