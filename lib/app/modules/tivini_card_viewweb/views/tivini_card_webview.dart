import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/values/app_assets.dart';
import '../../../../data/cart_local_store.dart';
import '../../../../data/helper.dart';
import '../controllers/tivini_card_webview_controller.dart';

/*
class TiviniCardWebView
    extends GetView<TiviniCardWebViewController> {


  WebViewController createWebviewControler(
      BuildContext context, dynamic initialUrl) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('progess :: ${progress}');
            print('onProgress');



            controller.isLoading.value=false;

          },
          onPageStarted: (String url) {
            print('onPageStarted');
          },
          onPageFinished: (String url) {
            controller.isLoading.value=true;

            print('onPageFinished');
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print('request :: $request');

            return request.url == initialUrl
                ? NavigationDecision.navigate
                : NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://www.tevini.co.uk/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text(
            'Tevini Card',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body:

        SafeArea(
          child:

          WebViewWidget(
                  controller: createWebviewControler(
                      context, "https://www.tevini.co.uk/login"),
          )
        )


    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TiviniCardWebView extends StatefulWidget {
  static const routeName = "/privacy_policy";

  const TiviniCardWebView({super.key});

  @override
  State<TiviniCardWebView> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<TiviniCardWebView> {
  late final WebViewController _controller;
  bool _loading = true;





  @override
  void initState() {
    _controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams())
      ..setNavigationDelegate(NavigationDelegate(
          onPageFinished: (_) => setState(() {
            _loading = false;
          })))
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))

     // ..loadFlutterAsset("assets/privacy_policy.html");

    ..loadRequest(Uri.parse("https://www.tevini.co.uk/login"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Tevini',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        WebViewWidget(controller: _controller),
        if (_loading) const Center(child: CircularProgressIndicator())
      ]),
    );
  }
}