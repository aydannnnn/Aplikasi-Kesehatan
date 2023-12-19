import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mylab/app/modules/home/views/webview_custom.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Gantilah dengan import sesuai struktur proyek Anda

void main() {
  testWidgets('WebviewCustom widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: WebviewCustom(),
    ));

    // Verify if the WebView widget is present.
    expect(find.byType(WebView), findsOneWidget);

    // You can add more test cases based on your requirements.
  });
}
