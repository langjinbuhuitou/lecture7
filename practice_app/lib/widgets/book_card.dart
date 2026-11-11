import 'package:flutter/material.dart';

import '../models/library_book.dart';

/// 书单列表项：把一本数据和点击行为交给外部，列表页不再重复写这段 UI。
class BookCard extends StatelessWidget {
  final LibraryBook book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(radius: 16, child: Text('${book.id}')),
        title: Text(book.title),
        subtitle: Text('${book.category} · ${book.author}'),
        trailing: book.read
            ? const Chip(
                label: Text('已读'),
                visualDensity: VisualDensity.compact,
              )
            : Text('${book.borrowCount}次'),
        onTap: onTap,
      ),
    );
  }
}
