class BookModel {
  final String title;
  final String author;
  final String imageUrl;
  bool isFavorite = false; // TODO: cambiar a inmutable si es necesario

  BookModel({
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final title = json['title'] ?? 'Sin título';
    final authorList = json['author_names'] ?? ['Autor desconocido'];
    final author = authorList.isNotEmpty ? authorList[0] : 'Autor desconocido';

    final coverId = json['cover_id'];
    final imageUrl = coverId != null
        ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
        : '';

    return BookModel(
      title: title,
      author: author,
      imageUrl: imageUrl,
    );
  }
}



