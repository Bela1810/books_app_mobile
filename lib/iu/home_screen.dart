
import 'package:flutter/material.dart';
import 'package:books_app/domain/model/book_model.dart';
import 'package:books_app/data/service/book_service.dart';
import 'package:books_app/iu/book_item/widgets/empty_state.dart';
import 'package:books_app/iu/book_item/widgets/loading.dart';
import 'package:books_app/iu/book_item/book_item_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(List<BookModel>) onBooksLoaded;
  final List<BookModel> initialBooks;

  const HomeScreen({
    super.key,
    required this.onBooksLoaded, 
    required this.initialBooks,
    });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<BookModel> _bookList = [];
  bool _isLoading = false;

  final BookService _bookService = BookService();

  Future<void> _fetchBooks() async {

    setState(() {
      _isLoading = true;
    });

    try {
      final bookList = await _bookService.fetchBooks();
      await Future.delayed(const Duration(seconds: 2)); 

      if (!mounted) return;

      setState(() {
        _bookList = bookList;
        _isLoading = false;
      });

      widget.onBooksLoaded(bookList);
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  void _pressedFavorite(BookModel book) {
    setState(() {
      book.isFavorite = !book.isFavorite;
    });

    widget.onBooksLoaded(_bookList);
  }

  @override
    void initState() {
      super.initState();
      if (widget.initialBooks.isNotEmpty) {
        _bookList = widget.initialBooks;
      } else {
        _fetchBooks(); 
      }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCDB9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3E4D4),
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
        child: _isLoading
            ? const Loading()
            : _bookList.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _bookList.length,
                    itemBuilder: (context, index) {
                      final book = _bookList[index];
                      return BookItemScreen(
                        book: book,
                        onFavoritePressed: () => _pressedFavorite(book),
                      );
                    },
                  ),
      ),
    );
  }
}


