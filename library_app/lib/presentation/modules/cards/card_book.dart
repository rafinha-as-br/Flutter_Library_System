import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';

/// this card shows a book
class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book, required this.onTap});
  final Book book;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            children: [
              Icon(
                Icons.book,
                size: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: Theme.of(context).textTheme.displaySmall,),
                  Text('${book.author} - ${book.gender}')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
