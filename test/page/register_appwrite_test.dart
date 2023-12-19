import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mylab/app/modules/register/views/register_appwrite.dart';

void main() {
  testWidgets('RegisterAppwrite widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterAppwrite(),
      ),
    );

    // Verify if the RegisterAppwrite widget is present.
    expect(find.byType(RegisterAppwrite), findsOneWidget);

    // Input some text in the email TextField.
    await tester.enterText(find.byType(TextField).at(0), 'rosydan2@example.com');

    // Input some text in the password TextField.
    await tester.enterText(find.byType(TextField).at(1), 'rosydan1234');

    // Input some text in the name TextField.
    await tester.enterText(find.byType(TextField).at(2), 'Yaasir Rahmat');

    // Tap the Submit button.
    await tester.tap(find.text('Submit'));

    // Wait for the widgets to be rebuilt.
    await tester.pump();

    // You can add more test cases based on your requirements.
  });
}
