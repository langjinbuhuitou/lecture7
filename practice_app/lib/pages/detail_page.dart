import 'package:flutter/material.dart';

import '../models/detail_args.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArgs;
    final book = args.book;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('图书详情')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.title, style: theme.textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text(
                        '${book.author} 著',
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _InfoRow(label: '编号', value: 'No.${book.id}'),
                      _InfoRow(label: '分类', value: book.category),
                      _InfoRow(label: '借阅次数', value: '${book.borrowCount} 次'),
                      _InfoRow(label: '阅读状态', value: book.read ? '已读' : '未读'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    DetailResult(
                      bookId: book.id,
                      message: '《${book.title}》已标记为已读',
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('标记为已读并返回'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('直接返回'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Text(
              label,
              style: TextStyle(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
