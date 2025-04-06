import 'package:books_app/domain/model/book_model.dart';
import 'package:books_app/iu/book_item/book_detail/book_detail_screen.dart';
import 'package:books_app/iu/book_item/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFF2D5581)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NavigationBarApp(), 
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/bookDetail') {
          final book = settings.arguments as BookModel;
          return MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
          );
        }
        return null;
      },
    );
  }
}



