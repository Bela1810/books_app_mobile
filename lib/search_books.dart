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
    if (query.isEmpty) return; 

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
      appBar: AppBar(
        title: Text("Buscar Libros", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: Colors.amber[900],
        ),
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
              onSubmitted: searchBooks,
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

                      return ListTile(
                        leading: Image.network(
                          coverId != null
                              ? "https://covers.openlibrary.org/b/id/$coverId-L.jpg"
                              : "", // Si no hay cover, le damos una URL vacía
                          width: 50,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Si falla la portada (404 o no existe)
                            return Image.asset(
                              'assets/default.jpg',
                              width: 50,
                              height: 75,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
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


