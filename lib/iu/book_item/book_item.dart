import 'package:books_app/domain/model/book_model.dart';
import 'package:books_app/iu/book_item/book_detail/book_detail_screen.dart';
import 'package:books_app/iu/book_item/widgets/book_image.dart';
import 'package:books_app/iu/book_item/widgets/book_info.dart';
import 'package:flutter/material.dart';


class BookItem extends StatelessWidget {
  final BookModel book;

  const BookItem({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) => BookDetailScreen(book: book),
            transitionsBuilder: (_, animation, __, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeInOut)),
                ),
                child: child,
              );
            },
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
              child: BookInfo(title: book.title, author: book.author),
            ),
            Icon(
              Icons.bookmark_border_sharp,
              color: book.isFavorite ? Colors.red : Color(0xFF546A7B),
            ),
          ],
        ),
      ),
    );
  }
}


