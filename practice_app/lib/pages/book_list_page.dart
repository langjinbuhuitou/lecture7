import 'package:flutter/material.dart';

import '../data/library_data.dart';
import '../models/detail_args.dart';
import '../models/library_book.dart';
import '../widgets/book_card.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  static const int _pageSize = 20;

  final List<LibraryBook> _books = buildLibraryBooks();
  int _visibleCount = _pageSize;

  void _loadMore() {
    setState(() {
      _visibleCount = (_visibleCount + _pageSize).clamp(0, _books.length);
    });
  }

  Future<void> _openDetail(int index) async {
    final result = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: DetailArgs(book: _books[index]),
    );
    if (!mounted || result is! DetailResult) return;
    final target = _books.indexWhere((book) => book.id == result.bookId);
    if (target == -1) return;
    setState(() {
      _books[target] = _books[target].copyWith(read: true);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(result.message)));
  }

  @override
  Widget build(BuildContext context) {
    final books = _books.take(_visibleCount).toList();
    final allLoaded = _visibleCount >= _books.length;

    return Scaffold(
      appBar: AppBar(title: const Text('书单')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Row(
                  children: [
                    Text(
                      '已加载 $_visibleCount / ${_books.length} 条',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'ListView.builder 懒构建',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return BookCard(
                      book: book,
                      onTap: () => _openDetail(index),
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: FilledButton.icon(
                      onPressed: allLoaded ? null : _loadMore,
                      icon: const Icon(Icons.expand_more),
                      label: Text(
                        allLoaded ? '已加载全部 ${_books.length} 条' : '加载更多（+20）',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
