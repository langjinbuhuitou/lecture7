import 'package:flutter/material.dart';

/// 首页的统计小卡片：数值、文字和图标都由外部传入。
class StatBadge extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const StatBadge({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
            style: TextStyle(fontSize: 12, color: theme.colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
