import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewCustom extends StatelessWidget {
  const WebviewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://www.halodoc.com/',
        ),
      ),
    );
  }
}