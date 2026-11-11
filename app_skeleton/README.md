# app_skeleton —— 课堂案例复现

本工程对应实践指南七第五节的课堂案例，完成“首页网格 → 分类列表 → 图书详情”的三页骨架。

## 功能

- 首页用 `GridView` 展示 5 个图书分类，点击分类进入列表页，列表按分类过滤。
- 列表页用 `ListView.builder` 渲染数据，点击书目通过命名路由 `/detail` 跳转，`arguments` 传入 `Book` 实例。
- 详情页用 `ModalRoute.of(context)!.settings.arguments` 接收参数，完整显示书名、作者、分类、出版社、年份、借阅次数和简介。
- 列表页长按任意书目弹出底部筛选层，选择“仅看高借阅量”后把结果 `pop` 回首页，显示在 AppBar 副标题上。

## 目录

```
lib/
├── main.dart                 # 路由表与主题
├── models/
│   ├── book.dart             # Book 模型与 fromJson
│   └── list_args.dart        # 首页传给列表页的强类型参数
├── data/
│   └── book_repository.dart  # 读取 assets/books.json
└── pages/
    ├── home_page.dart        # 分类网格首页
    ├── list_page.dart        # 分类列表页
    └── detail_page.dart      # 图书详情页
```

## 运行

```bash
flutter pub get
flutter run -d chrome
```

## 提交记录

按指南要求分三步提交：

1. `feat: list page with builder`
2. `feat: named routes & typed arguments`
3. `feat: grid home & pop-with-value filter`

## AI 使用说明

本案例允许使用 TraeCode 跟随课堂完成。实际使用情况：

- 用 TraeCode 生成 `Book` 模型、`books.json` 的初始结构和 `ListView.builder` 的页面骨架；
- 路由注册、`arguments` 接收和底部弹层的返回值流程由本人按指南手写并调试；
- 每一版代码都在 Chrome 中实际运行，检查三页跳转、参数显示和回传值，并用 `flutter analyze` 确认没有静态错误。
