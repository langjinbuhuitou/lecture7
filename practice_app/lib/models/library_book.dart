/// 自主实践使用的图书模型。read 字段用来演示详情页把结果回传给列表页。
class LibraryBook {
  final int id;
  final String title;
  final String author;
  final String category;
  final int borrowCount;
  final bool read;

  const LibraryBook({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.borrowCount,
    this.read = false,
  });

  LibraryBook copyWith({bool? read}) {
    return LibraryBook(
      id: id,
      title: title,
      author: author,
      category: category,
      borrowCount: borrowCount,
      read: read ?? this.read,
    );
  }
}
