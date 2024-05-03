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

      expect(find.text('Welcome !'), findsOneWidget);

      var phoneField = find.widgetWithText(TextField, 'Phone Number');
      var otpField = find.widgetWithText(TextField, 'OTP');

      await tester.enterText(phoneField, '1234567890');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      var getActivationCodeButton =
          find.widgetWithText(ElevatedButton, 'Get Activation Code');
      await tester.tap(getActivationCodeButton);
      await tester.pumpAndSettle();

      await tester.enterText(otpField, '123456');
      await tester.pumpAndSettle();

      var activateButton = find.text('Activate');
      expect(activateButton, findsOneWidget);
      await tester.tap(activateButton);
      await tester.pumpAndSettle();

      // Verify navigation to HomePage
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
