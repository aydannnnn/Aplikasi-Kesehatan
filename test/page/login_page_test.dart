import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/login/controllers/account_controller.dart';
import 'package:mylab/app/modules/login/views/login_page.dart';

void main() {
  // Widget test for the LoginPage
  testWidgets('LoginPage widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        home: LoginPage(),
      ),
    );

    // Verify if the widgets on the LoginPage are present.
    expect(find.text('Silahkan login terlebih dahulu'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  // Unit test for gesture recognition
  test('Gesture recognition test', () {
    // Setup: Simulate the controller and controllers needed
    final accountController = AccountController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    // Provide input to controllers and call the gesture recognition function
    accountController.isLoading.value = false;
    emailController.text = 'rosydan@example.com';
    passwordController.text = 'rosydan1';

    // Gesture recognition for the "syarat" link
    accountController.handleSyaratTap();

    // Verify the results
    // Add assertions based on the expected behavior of the gesture recognition
  });
}
