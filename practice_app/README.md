# practice_app —— 自主实践

本工程是课堂作业七的自主实践部分，用一个“读书角”小应用把列表分页、命名路由、参数与返回值、组件抽取串联起来。

## 基本要求对应

| 序号 | 要求 | 实现位置 |
| --- | --- | --- |
| 1 | 列表分页模拟：builder + “加载更多”每次追加 20 条 | `lib/pages/book_list_page.dart`，初始 20 条，底部按钮每次 +20，最多 100 条 |
| 2 | 命名路由表：不少于 4 条，全部命名式 | `lib/main.dart` 注册 `/`、`/list`、`/detail`、`/about`，页面内全部使用 `pushNamed` |
| 3 | 参数与返回值：去程强类型模型，回程至少一处生效 | 去程 `DetailArgs(book)`，回程 `DetailResult(bookId, message)`，列表收到后把书目标记为“已读”并弹出提示 |
| 4 | 组件抽取：至少 2 个参数化复用组件 | `lib/widgets/stat_badge.dart`（label/value/icon）与 `lib/widgets/book_card.dart`（book/onTap） |
| 5 | AI 使用标注 | 见下方“AI 使用标注”和“关于本作业”页面 |

## 目录

```
lib/
├── main.dart                 # 4 条命名路由
├── data/library_data.dart    # 100 条模拟书目
├── models/
│   ├── library_book.dart     # 书目模型（含已读状态）
│   └── detail_args.dart      # 去程参数与回程结果
├── pages/
│   ├── home_page.dart        # 首页
│   ├── book_list_page.dart   # 分页列表
│   ├── detail_page.dart      # 详情页
│   └── about_page.dart       # 作业说明
└── widgets/
    ├── stat_badge.dart       # 参数化统计卡片
    └── book_card.dart        # 参数化书目卡片
```

## 运行

```bash
flutter pub get
flutter run -d chrome
```

## 提交记录

1. `feat: paged book list with builder`
2. `feat: home page and named routes`
3. `feat: detail page with typed arguments and result`
4. `feat: extract reusable stat badge and book card`

## AI 使用标注

- 用途：生成页面骨架、模拟数据和组件初始样式。
- 指令摘要：“用 ListView.builder 写一个每次追加 20 条的列表，底部放加载按钮”“详情页通过命名路由接收 LibraryBook，并用 pop 返回是否已读”。
- 输出处理：AI 给出的代码先通读，把参数改成强类型模型，删掉多余的注释和示例按钮；命名路由表、返回值类型和列表状态更新是自己补的。
- 验证方式：`flutter analyze` 无问题；在 Chrome 中实际点击“加载更多”、进入详情、返回列表，确认条数从 20 变 40、已读书目出现标签并弹出提示。
