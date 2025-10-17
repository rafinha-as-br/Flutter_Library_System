import 'package:flutter/material.dart';
import 'package:library_app/entities/book.dart';
import 'package:library_app/presentation/modules/cards/card_book.dart';
import 'package:library_app/presentation/providers/provider_main.dart';
import 'package:provider/provider.dart';

class SearchBookTab extends StatefulWidget {
  const SearchBookTab({super.key});


  @override
  State<SearchBookTab> createState() => _SearchBookTabState();
}

class _SearchBookTabState extends State<SearchBookTab> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainProvider>(context, listen: false).clearBookSuggestionsList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(
            hintText: 'Buscar livro',
            controller: _searchController,
            leading: const Icon(Icons.search),
            trailing: [
              if (_searchController.text.isNotEmpty)
                IconButton(
                  onPressed: () {
                    _searchController.clear();
                    mainProvider.clearBookSuggestionsList();
                  },
                  icon: const Icon(Icons.clear),
                )
            ],
            onChanged: (query) => mainProvider.searchBooks(query),
          ),
          if (mainProvider.bookSuggestionsList.isEmpty || _searchController.text.isEmpty)
            Column(
              children: [
                const SizedBox(height: 110),
                const Icon(
                  Icons.menu_book_outlined,
                  size: 120,
                ),
                const SizedBox(height: 15),
                Text(
                  'Busque um livro por título, autor ou gênero!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          if (mainProvider.bookSuggestionsList.isEmpty && _searchController.text.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text('Nenhum livro encontrado'),
            ),
          if (mainProvider.bookSuggestionsList.isNotEmpty && _searchController.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mainProvider.bookSuggestionsList.length,
                itemBuilder: (context, index) {
                  final book = mainProvider.bookSuggestionsList[index];
                  return BookCardA(book: book, onTap: () {});
                },
              ),
            ),
        ],
      ),
    );
  }
}