import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todolist/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final demoTask1 = 'demo 1';
  group('todo tasks', () {
    testWidgets('add new task check and uncheck', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final textField = find.byType(TextField).first;
      tester.enterText(textField, demoTask1);
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text(demoTask1), findsOneWidget);
    });
    testWidgets('verify checked', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final checkbox = find.byType(Checkbox);
      await tester.tap(checkbox);
      await tester.pumpAndSettle();
      expect(tester.widget<Checkbox>(checkbox).value, true);
    });

    testWidgets('verify uncheck task', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final checkbox = find.byType(Checkbox);
      await tester.tap(checkbox);
      await tester.pumpAndSettle();
      expect(tester.widget<Checkbox>(checkbox).value, false);
    });
  });
}
