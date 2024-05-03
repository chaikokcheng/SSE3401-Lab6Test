import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mad_lab5/homepage.dart';
import 'package:mad_lab5/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Integration Tests', () {
    testWidgets('Complete onboarding process', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());

      // Verify the onboarding page is shown
      expect(find.text('Welcome !'), findsOneWidget);

      // Enter the phone number
      await tester.enterText(find.byType(TextField).first, '109996666');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Check the checkbox to agree to the terms
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      // Tap on the 'Get Activation Code' button
      await tester
          .tap(find.widgetWithText(ElevatedButton, 'Get Activation Code'));
      await tester.pumpAndSettle();

      // Assume an OTP is entered and the 'Activate' button appears and is functional
      await tester.enterText(find.byType(TextField).last, '885566');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Tap on 'Activate' button
      await tester.tap(find.text('Activate'));
      await tester.pumpAndSettle();

      // Verify navigation to HomePage
      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('Complete flow from HomePage to submitting contact',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      // Find the FloatingActionButton by Icon and tap it to navigate to AddContactPage.
      final addButtonFinder =
          find.widgetWithIcon(FloatingActionButton, Icons.add);
      expect(addButtonFinder, findsOneWidget);
      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle(); // Wait for page transition

      // Find TextFields for name and phone number and enter some text.
      final nameField = find.widgetWithText(TextField, 'Type here');
      final phoneField =
          find.widgetWithText(TextField, 'Enter your phone number');

      expect(nameField, findsOneWidget);
      expect(phoneField, findsOneWidget);

      // Enter text into the TextFields
      await tester.enterText(nameField, 'John Doe');
      await tester.enterText(phoneField, '+1234567890');
      await tester.pump(); // Rebuild the widget with the new text.

      // Tap the 'Submit' button
      final submitButtonFinder = find.widgetWithText(ElevatedButton, 'Submit');
      await tester.tap(submitButtonFinder);
      await tester.pumpAndSettle(); // Wait for any animations

      // Expect the AlertDialog to appear after submission
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('You had done invited'), findsOneWidget);

      // Tap the 'Done' button on the AlertDialog
      final doneButtonFinder = find.widgetWithText(TextButton, 'Done');
      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle(); // Dismiss the AlertDialog
    });
  });
}
