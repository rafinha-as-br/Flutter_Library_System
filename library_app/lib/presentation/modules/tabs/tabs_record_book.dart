import 'package:flutter/material.dart';

class RecordBookTab extends StatelessWidget {
  const RecordBookTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [

          /// just a title for decoration
          Column(
            children: [
              Text(
                'Registrando um livro!',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10,)
            ],
          ),

          /// book title
          Column(
            children: [
              Text(
                'Informe o nome do livro',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              TextField(
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
                'Informe o autor do livro',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              TextField(
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
                'Informe os gêneros do livro',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              TextField(
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
                'Informe o ano de lançamento do livro',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Ano',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 22,)
            ],
          ),

          /// Add book button
          ElevatedButton(
            onPressed: (){

            },
            child: Text(
              'Adicionar livro',
              style: TextStyle(fontSize: 17),
            )
          )

        ],
      )
    );
  }
}
