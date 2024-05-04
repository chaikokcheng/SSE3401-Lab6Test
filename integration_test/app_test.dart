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
      await tester.pumpAndSettle();

      // Tap on the 'Factory 2' button
      var factory2Button = find.widgetWithText(ElevatedButton, 'Factory 2');
      await tester.tap(factory2Button);
      await tester.pumpAndSettle();

      // Tapping the settings icon to change factory number
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      // Tapping the settings icon to change factory number
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      // Tapping the settings icon to change factory number
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      // Navigate to Add Contact page by tapping the add contact button
      var addButton = find.widgetWithIcon(FloatingActionButton, Icons.add);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Enter 'Dr NG' in the 'Type here' field
      await tester.enterText(
          find.widgetWithText(TextField, 'Type here'), 'Dr NG');

      // Hide the keyboard and ensure UI has settled after the keyboard is dismissed
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Enter '128889999' in the 'Enter your phone number' field
      await tester.enterText(
          find.widgetWithText(TextField, 'Enter your phone number'),
          '128889999');
      await tester.pump();

      // Hide the keyboard and ensure UI has settled after the keyboard is dismissed
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Submit the contact form
      await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
      await tester.pumpAndSettle();

      // Close the success dialog
      await tester.tap(find.widgetWithText(TextButton, 'Done'));
      await tester.pumpAndSettle();

      // Navigate to the home tab
      await tester.tap(find.byIcon(Icons.home_outlined));
      await tester.pumpAndSettle();

      // Navigate back to 'Factory 1'
      var factory1Button = find.widgetWithText(ElevatedButton, 'Factory 1');
      await tester.tap(factory1Button);
      await tester.pumpAndSettle();

      // Navigate again to 'Factory 2'
      await tester.tap(factory2Button);
      await tester.pumpAndSettle();

      // Navigate to the settings tab
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Interact specific widget t
      final parameterField = find.descendant(
        of: find.byType(Container),
        matching: find.byType(TextField).first,
      );

      // Ensure the text field is found
      expect(parameterField, findsOneWidget);

      // Tap the text field to gain focus
      await tester.tap(parameterField);
      await tester.pumpAndSettle();

      // Clear the existing text
      await tester.enterText(parameterField, '');
      await tester.pumpAndSettle();

      // Enter the new value "39"
      await tester.enterText(parameterField, '39');
      await tester.pumpAndSettle();

      // Optionally, verify the new value is entered correctly
      expect(find.text('39'), findsOneWidget);
    });
  });
}
