import 'package:flutter/material.dart';
import 'package:library_app/presentation/providers/provider_main.dart';
import 'package:provider/provider.dart';

/// this tab allow the system user to search any books that exists in the database, it can be or
/// not available in the colection
class SearchBookTab extends StatelessWidget {
  const SearchBookTab({super.key});


  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Column(
      children: [

      ],
    );
  }
}
