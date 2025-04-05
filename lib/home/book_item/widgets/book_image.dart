import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;

  const BookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        imageUrl,
        height: 210,
        width: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}

