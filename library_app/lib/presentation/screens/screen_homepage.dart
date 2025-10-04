import 'package:flutter/material.dart';
import 'package:library_app/presentation/screens/screen_edit.dart';
import 'package:library_app/presentation/screens/screen_register.dart';
import 'package:library_app/presentation/screens/screen_reserve.dart';
import 'package:library_app/presentation/screens/screen_search.dart';

/// this screen is the main screen that is responsible for
/// going to any of the 3 main screens
class HomePageScreen extends StatefulWidget {
  HomePageScreen({super.key});

  /// list of screens
  final List<Widget> pages = [
    SearchScreen(),
    RegisterScreen(),
    EditScreen(),
    ReserveScreen()
  ];

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  /// index of pages
  int selectedIndex = 0;

  /// toggle function
  void togglePage(int index){
    setState(() {
      selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: togglePage,
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
              icon: Icon(Icons.edit),
              label: 'Editar'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Reservar'
          ),

        ],
      ),
    );
  }
}
