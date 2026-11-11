import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('关于本作业')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('作业说明', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text(
                '本工程是第 9 周课堂作业七的自主实践部分，用列表分页、命名路由、参数传递和组件抽取把课上学的几个知识点串起来。',
                style: TextStyle(height: 1.8),
              ),
              const SizedBox(height: 24),
              Text('功能清单', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text(
                '1. 列表分页：ListView.builder 懒构建，每次“加载更多”追加 20 条；\n'
                '2. 命名路由：/、/list、/detail、/about 四条路由，全部用 pushNamed 跳转；\n'
                '3. 参数与返回值：去程传 LibraryBook 模型，回程用 DetailResult 告诉列表是否已读；\n'
                '4. 组件抽取：StatBadge 与 BookCard 两个参数化组件放在 lib/widgets/ 下。',
                style: TextStyle(height: 1.9),
              ),
              const SizedBox(height: 24),
              Text('AI 使用标注', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text(
                '使用 TraeCode 辅助生成页面骨架和模拟数据，路由注册、详情页返回值与列表状态更新由本人手写并调试。'
                '所有代码都经过 flutter analyze 检查和浏览器实际点击验证，AI 生成部分已按自己的理解改写。',
                style: TextStyle(height: 1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
