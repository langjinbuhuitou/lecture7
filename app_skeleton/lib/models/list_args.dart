/// 首页传给列表页的强类型参数，避免用 Map 传值后到处做类型转换。
class ListArgs {
  final String category;

  const ListArgs({required this.category});
}
