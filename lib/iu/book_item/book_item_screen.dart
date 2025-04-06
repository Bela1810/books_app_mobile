import 'package:books_app/domain/model/book_model.dart';
import 'package:books_app/iu/book_item/widgets/book_image.dart';
import 'package:books_app/iu/book_item/widgets/book_info.dart';
import 'package:books_app/iu/book_item/book_detail/book_detail_screen.dart';
import 'package:flutter/material.dart';

class BookItemScreen extends StatelessWidget {
  final BookModel book;
  final VoidCallback onFavoritePressed;

  const BookItemScreen({
    super.key,
    required this.book,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        padding: const EdgeInsets.all(19),
        decoration: BoxDecoration(
          color: const Color(0xFFF4EDF4),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookImage(imageUrl: book.imageUrl),
            const SizedBox(width: 25),
            Expanded(
              child: BookInfo(
                title: book.title,
                author: book.author,
              ),
            ),
            GestureDetector(
              onTap: onFavoritePressed,
              child: Icon(
                book.isFavorite ? Icons.bookmark : Icons.bookmark_border_sharp,
                color: book.isFavorite ? Color.fromARGB(255, 168, 2, 21) : Color(0xFF2D5581), size: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






