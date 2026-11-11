import 'package:flutter/material.dart';

import '../data/book_repository.dart';
import '../models/book.dart';
import '../models/list_args.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Book>> _future;
  String? _category;

  @override
  void initState() {
    super.initState();
    _future = loadBooks();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is ListArgs) {
      _category = args.category;
    }
  }

  Future<void> _pickFilter() async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('筛选方式'),
                subtitle: Text('当前分类：${_category ?? '全部图书'}'),
              ),
              ListTile(
                leading: const Icon(Icons.local_fire_department),
                title: const Text('仅看高借阅量'),
                subtitle: const Text('借阅次数 ≥ 70 次'),
                onTap: () => Navigator.pop(sheetContext, '仅看高借阅量'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
    if (!mounted || choice == null) return;
    // 选择结果作为返回值回传给首页，由 AppBar 副标题展示。
    Navigator.pop(context, '已选择：$choice · ${_category ?? '全部图书'}');
  }

  @override
  Widget build(BuildContext context) {
    final title = _category == null ? '全部图书' : '$_category图书';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.touch_app,
                      size: 18,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '提示：长按任意书目，选择筛选条件后会把结果回传给首页',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Book>>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('数据加载失败：${snapshot.error}'));
                    }
                    final all = snapshot.data ?? <Book>[];
                    final books = _category == null
                        ? all
                        : all
                              .where((book) => book.category == _category)
                              .toList();
                    return ListView.builder(
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
                          onLongPress: _pickFilter,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
