class Book {
  final int id;
  final String title;
  final String author;
  final String category;
  final String publisher;
  final int year;
  final int borrowCount;
  final String summary;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.publisher,
    required this.year,
    required this.borrowCount,
    required this.summary,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
      publisher: json['publisher'] as String,
      year: json['year'] as int,
      borrowCount: json['borrowCount'] as int,
      summary: json['summary'] as String,
    );
  }

  bool get isHot => borrowCount >= 70;
}
