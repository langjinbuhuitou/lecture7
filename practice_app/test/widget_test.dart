import 'package:flutter_test/flutter_test.dart';

import 'package:practice_app/main.dart';

void main() {
  testWidgets('首页显示应用标题', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('读书角'), findsOneWidget);
  });
}
