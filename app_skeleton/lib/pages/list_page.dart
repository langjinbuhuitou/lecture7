import 'package:flutter/material.dart';

import '../data/book_repository.dart';
import '../models/book.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Book>> _future;

  @override
  void initState() {
    super.initState();
    _future = loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('图书列表')),
      body: FutureBuilder<List<Book>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('数据加载失败：${snapshot.error}'));
          }
          final books = snapshot.data ?? <Book>[];
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                    leading: const Icon(Icons.menu_book),
                    title: Text(book.title),
                    subtitle: Text('${book.category} · ${book.author}'),
                    trailing: Text('${book.borrowCount}次'),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: book,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
