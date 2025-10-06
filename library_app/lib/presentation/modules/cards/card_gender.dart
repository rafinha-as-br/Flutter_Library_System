import 'package:flutter/material.dart';
import 'package:library_app/presentation/screens/screen_view_genders.dart';

/// this card is to show the genders available in the collection and the amount
/// of books
class GenderCard extends StatelessWidget {
  const GenderCard({super.key, required this.genderName, required this.amount});
  final String genderName;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12)
      ),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: (){

        },
        child: Container(
          height: 110,
          child: Column(
            children: [
              Icon(
                Icons.menu_book_rounded,
                size: 65,
              ),
              Text(genderName,),
              Text('Disponível: $amount')

            ],
          ),
        ),
      )
    );
  }
}
