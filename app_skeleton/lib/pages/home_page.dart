import 'package:flutter/material.dart';

import '../models/list_args.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _categories = ['计算机', '文学', '历史', '科学', '艺术'];
  static const Map<String, IconData> _icons = {
    '计算机': Icons.computer,
    '文学': Icons.auto_stories,
    '历史': Icons.account_balance,
    '科学': Icons.science,
    '艺术': Icons.palette,
  };

  String? _filterResult;

  Future<void> _openList(String category) async {
    final result = await Navigator.pushNamed(
      context,
      '/list',
      arguments: ListArgs(category: category),
    );
    if (!mounted || result is! String) return;
    setState(() => _filterResult = result);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('校园图书馆'),
            Text(
              _filterResult ?? '选择一个分类开始浏览',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('图书分类', style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth >= 860
                          ? 5
                          : constraints.maxWidth >= 560
                          ? 3
                          : 2;
                      return GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columns,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.45,
                            ),
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          return Card(
                            elevation: 0,
                            color: theme.colorScheme.surfaceContainerHighest,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => _openList(category),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      _icons[category],
                                      size: 32,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      category,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
