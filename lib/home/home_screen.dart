import 'package:books_app/home/book_item/book_item.dart';
import 'package:flutter/material.dart';
// Asegúrate de importar correctamente tu archivo Book.dart

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCDB9), // fondo de toda la pantalla
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3E4D4), // encabezado
        title: const Text(
          'BooksApp',
          style: TextStyle(
            color: Color(0xFF2D5581),
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            BookItem(
              title: "Pride and Prejudice",
              author: "Jane Austen",
              imageUrl: "https://ia802309.us.archive.org/view_archive.php?archive=/20/items/l_covers_0008/l_covers_0008_09.zip&file=0008090270-L.jpg",
              isFavorite: true,
            ),
            BookItem(
              title: "Pride and Prejudice",
              author: "Jane Austen",
              imageUrl: "https://ia802309.us.archive.org/view_archive.php?archive=/20/items/l_covers_0008/l_covers_0008_09.zip&file=0008090270-L.jpg",
              isFavorite: true,
            ),

            BookItem(
              title: "Pride and Prejudice",
              author: "Jane Austen",
              imageUrl: "https://ia802309.us.archive.org/view_archive.php?archive=/20/items/l_covers_0008/l_covers_0008_09.zip&file=0008090270-L.jpg",
              isFavorite: true,
            ),
            BookItem(
              title: "Pride and Prejudice",
              author: "Jane Austen",
              imageUrl: "https://ia802309.us.archive.org/view_archive.php?archive=/20/items/l_covers_0008/l_covers_0008_09.zip&file=0008090270-L.jpg",
              isFavorite: true,
            ),

             // agrega más si quieres
          ],
        ),
      ),
    );
  }
}
