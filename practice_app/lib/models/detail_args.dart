import 'library_book.dart';

/// 列表页传给详情页的强类型参数。
class DetailArgs {
  final LibraryBook book;

  const DetailArgs({required this.book});
}

/// 详情页回传给列表页的结果，用来告诉列表“哪本书被标记为已读”。
class DetailResult {
  final int bookId;
  final String message;

  const DetailResult({required this.bookId, required this.message});
}
