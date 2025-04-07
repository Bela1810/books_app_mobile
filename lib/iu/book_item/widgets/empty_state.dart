import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.library_books_outlined,
            size: 80,
            color: Color(0xFF2D5581),
          ),
          SizedBox(height: 16),
          Text(
            'No books',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF2D5581),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
