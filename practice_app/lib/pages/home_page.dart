import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('读书角')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
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
                      Text('我的书架', style: theme.textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text(
                        '一个用来练习滚动列表与多页面导航的小应用：书单分页加载，点进详情可以标记已读，结果会带回列表页。',
                        style: TextStyle(
                          height: 1.7,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _StatItem(label: '藏书', value: '100 本', icon: Icons.menu_book),
                  const SizedBox(width: 12),
                  _StatItem(label: '分类', value: '5 类', icon: Icons.category),
                  const SizedBox(width: 12),
                  _StatItem(label: '每页', value: '20 条', icon: Icons.view_list),
                ],
              ),
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/list'),
                icon: const Icon(Icons.list_alt),
                label: const Text('浏览全部书单'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/about'),
                icon: const Icon(Icons.info_outline),
                label: const Text('关于本作业'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 8),
            Text(value, style: theme.textTheme.titleMedium),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
