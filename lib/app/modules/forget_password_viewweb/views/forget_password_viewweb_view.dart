import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/forget_password_viewweb_controller.dart';

class ForgetPasswordViewwebView
    extends GetView<ForgetPasswordViewwebController> {
  const ForgetPasswordViewwebView({Key? key}) : super(key: key);

  WebViewController createWebviewControler(
      BuildContext context, dynamic initialUrl) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

            print('progess :: ${progress}');
            // controller.isLoading.value = true;
            print('ForgetPasswordViewwebView.createWebviewControler ');
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print('ForgetPasswordViewwebView.createWebviewControler');
          },
          onPageFinished: (String url) {
            print('ForgetPasswordViewwebView.createWebviewControler');
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
      ..loadRequest(Uri.parse("https://www.tevini.co.uk/password/reset"));
      //..loadRequest(Uri.parse("https://www.tevini.co.uk/login"));
     // ..loadRequest(Uri.parse("https://www.tevini.co.uk/user/dashboard"));
     // ..loadRequest(Uri.parse("https://www.tevini.co.uk/user/card-service"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text(
            'Forget Password',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child:

          WebViewWidget(
                  controller: createWebviewControler(context, "https://www.tevini.co.uk/password/reset"),
              //    controller: createWebviewControler(context, "https://www.tevini.co.uk/login"),
            //      controller: createWebviewControler(context, "https://www.tevini.co.uk/user/dashboard"),
                 // controller: createWebviewControler(context, "https://www.tevini.co.uk/user/card-service"),
          )
        ));
  }
}
