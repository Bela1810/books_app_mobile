

class BookModel {
  final String title;
  final String author;
  final String imageUrl;
  bool isFavorite; 
  final int? coverId;
  final String? firstPublishYear;
  final String editionKeys;

  BookModel({
    required this.title,
    required this.author,
    required this.imageUrl,
    this.isFavorite = false,
    this.coverId,
    required this.firstPublishYear,
    required this.editionKeys,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final title = json['title'] ?? 'No title';
    final authorList = json['author_names'] ?? [''];
    final author = authorList.isNotEmpty ? authorList[0] : "Unknown";
    final coverId = json['cover_id'];
    final imageUrl = coverId != null
        ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
        : '';
    final editionKeys = (json['edition_key'] as List?)?.join(', ') ?? 'N/A';
    final firstPublishYear = json['first_publish_year']?.toString();

    return BookModel(
      title: title,
      author: author,
      imageUrl: imageUrl,
      coverId: coverId,
      firstPublishYear: firstPublishYear,
      editionKeys: editionKeys,
    );
    
  }
}



