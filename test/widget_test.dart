import 'package:flutter_test/flutter_test.dart';
import 'package:aime_app/main.dart';

void main() {
  testWidgets('AiMeApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AiMeApp());
    expect(find.byType(AiMeApp), findsOneWidget);
  });
}
