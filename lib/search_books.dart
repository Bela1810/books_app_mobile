import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookSearchScreen extends StatefulWidget {
  @override
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  List books = [];
  TextEditingController searchController = TextEditingController();

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) return; // Evita búsquedas vacías

    String url = "https://openlibrary.org/search.json?q=$query&limit=10";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        books = data["docs"];
      });
    } else {
      print("Error al buscar libros");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buscar Libros")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Buscar libro...",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => searchBooks(searchController.text),
                ),
              ),
              onSubmitted: searchBooks, // Busca al presionar "Enter"
            ),
          ),
          Expanded(
            child: books.isEmpty
                ? Center(child: Text("No hay resultados"))
                : ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      var book = books[index];
                      String title = book["title"] ?? "Sin título";
                      String author = book["author_name"]?.join(", ") ?? "Desconocido";
                      int? coverId = book["cover_i"];
                      String imageUrl = coverId != null
                          ? "https://covers.openlibrary.org/b/id/$coverId-L.jpg"
                          : "https://via.placeholder.com/100x150"; // Imagen de relleno

                      return ListTile(
                        leading: Image.network(imageUrl, width: 50, height: 75, fit: BoxFit.cover),
                        title: Text(title),
                        subtitle: Text(author),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
