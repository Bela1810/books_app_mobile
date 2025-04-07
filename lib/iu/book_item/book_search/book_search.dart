import 'package:books_app/data/service/book_search_service.dart';
import 'package:flutter/material.dart';


class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  BookSearchScreenState createState() => BookSearchScreenState();
}

class BookSearchScreenState extends State<BookSearchScreen> {
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
          "Search Books 🔎",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF2D5581),
      ),
      
      body: Column(
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

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFF2D5581),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: coverId != null
                                    ? Image.network(
                                        "https://covers.openlibrary.org/b/id/$coverId-L.jpg",
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/default.jpg',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        'assets/default.jpg',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(width: 19),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    author,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:Color.fromARGB(255, 119, 119, 119),
                                      fontWeight: FontWeight.bold ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

}
