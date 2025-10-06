import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';

/// this card shows a book
class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
