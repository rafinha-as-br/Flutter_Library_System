import 'package:flutter/material.dart';
import 'package:library_app/implementations/impl_book.dart';
import 'package:library_app/implementations/impl_book_person_tests.dart';
import 'package:library_app/implementations/impl_book_tests.dart';
import 'package:library_app/implementations/impl_person.dart';
import 'package:library_app/presentation/providers/provider_main.dart';
import 'package:library_app/presentation/screens/screen_homepage.dart';
import 'package:provider/provider.dart';

void main() {

  BookImpl bookRepository = BookImpl();
  BookImplTesting bookImplTesting = BookImplTesting();
  PersonImpl personRepository = PersonImpl();
  PersonImplTesting personImplTesting = PersonImplTesting();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainProvider(
              bookImplTesting, personImplTesting
          )),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),
    );
  }
}
