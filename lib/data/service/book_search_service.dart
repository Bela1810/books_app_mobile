import 'dart:convert';
import 'package:http/http.dart' as http;

class BookSearchService {

  static Future<List> searchBooks(String query) async {
    if (query.isEmpty) return [];

    String url = "https://openlibrary.org/search.json?q=$query&limit=10";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["docs"];
    } else {
      throw Exception("Error al buscar libros");
    }
  }
}
