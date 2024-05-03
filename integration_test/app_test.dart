import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mad_lab5/homepage.dart';
import 'package:mad_lab5/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Complete onboarding process', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify the onboarding page is shown
    expect(find.text('Welcome !'), findsOneWidget);

    // Enter the phone number and check the checkbox
    await tester.enterText(find.byType(TextField).first, '109996666');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    // Tap on the 'Get Activation Code' button
    await tester
        .tap(find.widgetWithText(ElevatedButton, 'Get Activation Code'));
    await tester.pumpAndSettle();

    // Check if the OTP input is visible
    expect(find.text('Enter the activation code you received via SMS.'),
        findsOneWidget);

    // Enter an OTP
    await tester.enterText(find.byType(TextField).last, '885566');
    await tester.pumpAndSettle();

    // Ensure 'Activate' button is visible before attempting to tap
    expect(find.text('Activate'), findsOneWidget);

    // Tap on 'Activate' button
    await tester.tap(find.text('Activate'));
    await tester.pumpAndSettle();

    // Verify navigation to HomePage
    expect(find.byType(HomePage), findsOneWidget);
  });
}
