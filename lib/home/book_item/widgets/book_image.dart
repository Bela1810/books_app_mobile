import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String? imageUrl;

  const BookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/default.jpg',
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
            )
          : Image.asset(
              'assets/default.jpg',
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
    );
  }
}


