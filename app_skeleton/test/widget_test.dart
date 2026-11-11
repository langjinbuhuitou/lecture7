import 'package:flutter_test/flutter_test.dart';

import 'package:app_skeleton/main.dart';

void main() {
  testWidgets('首页显示应用标题', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('校园图书馆'), findsOneWidget);
  });
}
