import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/book.dart';

/// 统一从 assets/books.json 读取图书数据，避免每个页面各写一份解析代码。
Future<List<Book>> loadBooks() async {
  final String raw = await rootBundle.loadString('assets/books.json');
  final List<dynamic> list = json.decode(raw) as List<dynamic>;
  return list
      .map((item) => Book.fromJson(item as Map<String, dynamic>))
      .toList();
}
