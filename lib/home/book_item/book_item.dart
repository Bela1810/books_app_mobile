import 'package:books_app/home/book_item/widgets/book_image.dart';
import 'package:books_app/home/book_item/widgets/book_info.dart';
import 'package:flutter/material.dart';


class BookItem extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final bool isFavorite;

  const BookItem({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EDF4),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookImage(imageUrl: imageUrl),
          const SizedBox(width: 16),
          Expanded(
            child: BookInfo(title: title, author: author),
          ),
          Icon(
            Icons.bookmark,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}

