import 'package:flutter/material.dart';
import 'package:library_app/presentation/screens/screen_homepage.dart';
import 'package:provider/provider.dart';

import '../../entities/book.dart';
import '../providers/provider_main.dart';

/// This screen allows the user do create or edit a screen
/// ** In the future there will be more features from this page
class BookFormScreen extends StatelessWidget {
  const BookFormScreen({super.key, required this.book});

  // if is to create a book, this book needs to be null
  final Book? book;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);


    final TextEditingController bookTitle = TextEditingController();
    final TextEditingController bookAuthor = TextEditingController();
    final TextEditingController bookGender = TextEditingController();
    final TextEditingController bookYear = TextEditingController();
    final TextEditingController bookAmount = TextEditingController();

    if(book !=null){
      bookTitle.text = book!.title;
      bookAuthor.text = book!.author;
      bookGender.text = book!.gender;
      bookYear.text = book!.year.toString();
      bookAmount.text = book!.amount.toString();

      print("Book id: ${book!.id}");
    }


    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [

            /// just a title for decoration
            Column(
              children: [

                if(book==null)Text(
                  'Registrando um livro!',
                  style: TextStyle(fontSize: 30),
                )
                else Text(
                  'Editando um livro!',
                  style: TextStyle(fontSize: 30),
                ),

                SizedBox(height: 10,)
              ],
            ),

            /// book title
            Column(
              children: [
                Text(
                  'Nome do livro',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                TextField(
                  controller: bookTitle,
                  decoration: InputDecoration(
                      labelText: 'Título',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 22,)
              ],
            ),

            /// book author
            Column(
              children: [
                Text(
                  'Autor do livro',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                TextField(
                  controller: bookAuthor,
                  decoration: InputDecoration(
                      labelText: 'Autor',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 22,)

              ],
            ),

            /// book gender
            Column(
              children: [
                Text(
                  'Gêneros do livro',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                TextField(
                  controller: bookGender,
                  decoration: InputDecoration(
                      labelText: 'Gênero',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 22,)
              ],
            ),

            /// book launch year
            Column(
              children: [
                Text(
                  'Ano de lançamento',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                TextField(
                  controller: bookYear,
                  decoration: InputDecoration(
                      labelText: 'Ano',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 22,)
              ],
            ),

            /// book amount
            Column(
              children: [
                Text(
                  'Quantidade disponível',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                TextField(
                  controller: bookAmount,
                  decoration: InputDecoration(
                      labelText: 'Quantidade',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 22,)
              ],
            ),

            /// Add book button
            if(book==null)
            ElevatedButton(
                onPressed: () async{
                  final insert = await mainProvider.insertBook(
                      bookTitle.text,
                      bookAuthor.text,
                      bookGender.text,
                      bookYear.text,
                      bookAmount.text
                  );

                  if(!insert.status){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erro!'),
                          content: Text('${insert.msg}'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageScreen())
                    );
                  }
                },
                child: Text(
                  'Adicionar livro',
                  style: TextStyle(fontSize: 17),
                )
            )
            else
            ElevatedButton(
                onPressed: () async{
                  final insert = await mainProvider.updateBook(
                      book!.id,
                      bookTitle.text,
                      bookAuthor.text,
                      bookGender.text,
                      bookYear.text,
                      bookAmount.text
                  );

                  if(!insert.status && context.mounted){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Erro!'),
                          content: Text('${insert.msg}'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else{
                    mainProvider.togglePage(0);
                  }
                },
                child: Text(
                  'Editar livro',
                  style: TextStyle(fontSize: 17),
                )
            )



          ],
        )
    );
  }
}
