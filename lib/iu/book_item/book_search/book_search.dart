import 'package:books_app/data/service/book_search_service.dart';
import 'package:flutter/material.dart';


class BookSearchScreen extends StatefulWidget {
  @override
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  List books = [];
  TextEditingController searchController = TextEditingController();

  Future<void> handleSearch(String query) async {
    try {
      final results = await BookSearchService.searchBooks(query);
      setState(() {
        books = results;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFCDB9),
      appBar: AppBar(
        title: Text(
          "Search Books",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF2D5581),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search...",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => handleSearch(searchController.text),
                  ),
                ),
                onSubmitted: handleSearch,
              ),
            ),
            Expanded(
              child: books.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Color(0xFF2D5581),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "No Results, Start Searching!!",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        var book = books[index];
                        String title = book["title"] ?? "No title";
                        String author = book["author_name"]?.join(", ") ?? "No author";
                        int? coverId = book["cover_i"];
                        return ListTile(
                          leading: Image.network(
                            coverId != null
                                ? "https://covers.openlibrary.org/b/id/$coverId-L.jpg"
                                : "",
                            width: 50,
                            height: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
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
      ),
    );
  }
}
