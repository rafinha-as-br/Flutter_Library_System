import 'package:flutter/material.dart';
import 'package:library_app/presentation/screens/screen_book_form.dart';
import 'package:library_app/presentation/screens/screen_collection.dart';
import 'package:library_app/presentation/screens/screen_search.dart';
import 'package:provider/provider.dart';

import '../providers/provider_main.dart';

/// this screen is the main screen that is responsible for
/// going to any of the 3 main screens
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});




  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context);

    /// list of screens
    final List<Widget> pages = [
      SearchScreen(),
      BookFormScreen(book: mainProvider.editableBook),
      CollectionScreen()
    ];


    return Scaffold(
      body: pages[mainProvider.homePageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainProvider.homePageIndex,
        onTap: mainProvider.togglePage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisar'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Cadastrar'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Coleção'
          ),

        ],
      ),
    );
  }
}

