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
      backgroundColor: Color(0xFFDFCDB9),
      appBar: AppBar(
        title: const Text('Library 📖', 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
          color: Colors.white
        ),),
        backgroundColor: Color(0xFF2D5581),
      ),
      body: favoriteBooks.isEmpty? const Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book_rounded,
                size: 80,
                color: Color(0xFF2D5581),
              ),
              SizedBox(height: 16),
              Text(
                'Your library is empty, Start to save books!', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        )
      : ListView.builder(
          itemCount: favoriteBooks.length,
          itemBuilder: (context, index) {
            final book = favoriteBooks[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(5),
              child: BookItemScreen(
                book: book,
                onFavoritePressed: () {
                  setState(() {
                    book.isFavorite = !book.isFavorite;
                  });
                },
              ),
            );
          },
        ),


    );
  }
}


