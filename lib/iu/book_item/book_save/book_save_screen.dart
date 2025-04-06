import 'package:books_app/domain/model/book_model.dart';
import 'package:books_app/iu/book_item/book_item_screen.dart';
import 'package:flutter/material.dart';

class BookSaveScreen extends StatefulWidget {
  final List<BookModel> allBooks;

  const BookSaveScreen({super.key, required this.allBooks});

  @override
  State<BookSaveScreen> createState() => _BookSaveScreenState();
}

class _BookSaveScreenState extends State<BookSaveScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteBooks = widget.allBooks.where((book) => book.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardados'),
        backgroundColor: Color(0xFF2D5581),
        foregroundColor: Colors.white,
      ),
      body: favoriteBooks.isEmpty
          ? const Center(child: Text('No tienes libros guardados'))
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                return BookItemScreen(
                  book: book,
                  onFavoritePressed: () {
                    setState(() {
                      book.isFavorite = !book.isFavorite;
                    });
                  },
                );
              },
            ),
    );
  }
}


