

import 'package:flutter/material.dart';
import 'package:books_app/domain/model/book_model.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;
  

  const BookDetailScreen({
  super.key,
  required this.book,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF3E4D4),
      ),
      backgroundColor: const Color(0xFFDFCDB9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              const SizedBox(height: 40),
              Center(
                child: Card(
                  child: Image.network(
                    book.imageUrl,
                    height: 300,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        book.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        book.author,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 119, 119, 119),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "📚 Cover ID:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      book.coverId?.toString() ?? 'Sin cover ID',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 119, 119, 119)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "📅 Publish Year:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      book.firstPublishYear?.toString() ?? 'No year',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 119, 119, 119)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "🗂️ Editions:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      book.editionKeys.replaceAll(",", ", "),
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 119, 119, 119)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
