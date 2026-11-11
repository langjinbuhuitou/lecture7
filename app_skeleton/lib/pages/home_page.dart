import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('校园图书馆')),
      body: Center(
        child: FilledButton.icon(
          onPressed: () => Navigator.pushNamed(context, '/list'),
          icon: const Icon(Icons.list_alt),
          label: const Text('进入图书列表'),
        ),
      ),
    );
  }
}
