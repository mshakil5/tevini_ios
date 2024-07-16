import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewConvertToApp extends StatelessWidget {
  const WebViewConvertToApp({super.key});




  WebViewController createWebviewControler(
      BuildContext context, dynamic initialUrl) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

            //controller.isLoading.value=true;
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
           // controller.isLoading.value=true;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return request.url == initialUrl
                ? NavigationDecision.navigate
                : NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://pub.dev/packages/webview_flutter'));
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
