import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mad_lab5/homepage.dart';
import 'package:mad_lab5/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Integration Tests', () {
    testWidgets('Complete onboarding process', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the onboarding page is shown
      expect(find.text('Welcome !'), findsOneWidget);

      // Enter phone number
      await tester.enterText(
          find.widgetWithText(TextField, 'Phone Number'), '1234567890');
      await tester.pumpAndSettle();

      // Check the checkbox to agree to the terms
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Tap on the 'Get Activation Code' button
      await tester
          .tap(find.widgetWithText(ElevatedButton, 'Get Activation Code'));
      await tester.pumpAndSettle();

      // Enter OTP
      await tester.enterText(find.widgetWithText(TextField, 'OTP'), '123456');
      await tester.pumpAndSettle();

      // Hide the keyboard and ensure UI has settled after the keyboard is dismissed
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Tap on 'Activate' button
      await tester.tap(find.text('Activate'));
      await tester.pumpAndSettle();

      // Verify navigation to HomePage
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
