import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:books_app/domain/model/book_model.dart';

class BookService {
  Future<List<BookModel>> fetchBooks() async {
    final url = Uri.parse('https://openlibrary.org/people/mekBot/books/want-to-read.json');
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> entries = decoded['reading_log_entries'];

        final bookList = entries.map((entry) {
          final bookData = entry['work'] ?? {};
          return BookModel.fromJson(bookData);
        }).toList();

        return bookList;
      } else {
        throw Exception('No se pudieron obtener los libros. Código: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Ocurrió un error procesando los datos del API');
    }
  }
}




