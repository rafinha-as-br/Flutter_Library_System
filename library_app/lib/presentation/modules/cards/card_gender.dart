import 'package:flutter/material.dart';

/// this card is to show the genders available in the collection and the amount
/// of books
class GenderCard extends StatelessWidget {
  const GenderCard({super.key, required this.genderName, required this.amount});
  final String genderName;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
