import '../models/library_book.dart';

class _Seed {
  final String title;
  final String author;
  final String category;

  const _Seed(this.title, this.author, this.category);
}

const List<_Seed> _seeds = [
  _Seed('Flutter实战', '亢少军', '计算机'),
  _Seed('Dart语言程序设计', '李宁', '计算机'),
  _Seed('算法导论', 'Thomas H. Cormen', '计算机'),
  _Seed('代码整洁之道', 'Robert C. Martin', '计算机'),
  _Seed('深入理解计算机系统', 'Randal E. Bryant', '计算机'),
  _Seed('活着', '余华', '文学'),
  _Seed('平凡的世界', '路遥', '文学'),
  _Seed('围城', '钱锺书', '文学'),
  _Seed('白夜行', '东野圭吾', '文学'),
  _Seed('人类简史', '尤瓦尔·赫拉利', '历史'),
  _Seed('万历十五年', '黄仁宇', '历史'),
  _Seed('中国通史', '吕思勉', '历史'),
  _Seed('枪炮、病菌与钢铁', '贾雷德·戴蒙德', '历史'),
  _Seed('时间简史', '史蒂芬·霍金', '科普'),
  _Seed('万物简史', '比尔·布莱森', '科普'),
  _Seed('自私的基因', '理查德·道金斯', '科普'),
  _Seed('艺术的故事', '贡布里希', '艺术'),
  _Seed('设计中的设计', '原研哉', '艺术'),
  _Seed('写给大家看的设计书', 'Robin Williams', '艺术'),
  _Seed('西方美术史', '张敢', '艺术'),
];

/// 模拟 100 条书目数据，供分页演示使用。
List<LibraryBook> buildLibraryBooks() {
  return List.generate(100, (index) {
    final seed = _seeds[index % _seeds.length];
    final edition = index ~/ _seeds.length + 1;
    return LibraryBook(
      id: index + 1,
      title: '${seed.title}（第$edition版）',
      author: seed.author,
      category: seed.category,
      borrowCount: 20 + (index * 37) % 80,
    );
  });
}
