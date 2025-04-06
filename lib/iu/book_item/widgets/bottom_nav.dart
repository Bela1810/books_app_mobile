import 'package:books_app/domain/model/book_model.dart';
import 'package:books_app/iu/book_item/book_save/book_save_screen.dart';
import 'package:books_app/iu/book_item/book_search/book_search.dart';
import 'package:books_app/iu/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;
  List<BookModel> _bookList = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        initialBooks: _bookList,
        onBooksLoaded: (books) {
          setState(() {
            _bookList = books;
          });
        },
      ),
      BookSearchScreen(),
      BookSaveScreen(allBooks: _bookList),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFFF3E4D4),
        indicatorColor: Color.fromARGB(155, 255, 255, 255),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home, size: 30.0,color:Color(0xFF2D5581)), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.search,  size: 30.0,color: Color(0xFF2D5581)), label: 'Search'),
          NavigationDestination(
              icon: Icon(Icons.book_rounded, size: 30.0, color: Color(0xFF2D5581)), label: 'Library'),
        ],
      ),
    );
  }
}



