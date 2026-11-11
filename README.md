# lecture7 — 可滚动组件与多页面结构

第 9 周课堂作业七仓库，包含两个相互独立的 Flutter 工程：

| 目录 | 内容 | 说明 |
| --- | --- | --- |
| `app_skeleton/` | 课堂案例复现 | 首页网格 → 分类列表 → 图书详情，命名路由、强类型传参、pop 回传筛选结果 |
| `practice_app/` | 自主实践 | 分页加载列表、4 条命名路由、强类型参数与返回值、参数化组件抽取 |

## 运行方式

两个工程都需要 Flutter 3.x 环境，均以 Web 为运行目标：

```bash
cd app_skeleton
flutter pub get
flutter run -d chrome
```

```bash
cd practice_app
flutter pub get
flutter run -d chrome
```

也可以在工程目录执行 `flutter build web`，再用任意静态服务器打开 `build/web`。

## 目录约定

- 每个工程内部都有自己的 `lib/`、`assets/`、`README.md`，互不依赖。
- 页面放在 `lib/pages/`，数据模型放在 `lib/models/`，可复用组件放在 `lib/widgets/`。
- 提交按实践指南的步骤拆分，`git log --oneline` 可以看到每一步的提交信息。

## AI 使用说明

本次作业使用 TraeCode 辅助完成，主要用途是生成初始代码骨架、解释报错信息和检查空安全写法。所有 AI 生成的代码都经过逐行阅读、`flutter analyze` 检查和浏览器实际运行验证；具体到每一步的用途与验证方式，分别记录在两个工程目录下的 `README.md` 和进度报告中。
