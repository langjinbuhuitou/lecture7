import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/book_list_page.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '读书角',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/list': (context) => const BookListPage(),
        '/detail': (context) => const DetailPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
