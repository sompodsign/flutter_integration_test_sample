import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todolist/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('main screen elements', () {
    testWidgets('verify all elements on main screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('TodoList'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('new task'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
