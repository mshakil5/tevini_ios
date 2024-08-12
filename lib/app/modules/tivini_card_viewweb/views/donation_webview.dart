import 'package:flutter/material.dart';
import 'package:tenvini/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DonationWebview extends StatefulWidget {
  static const routeName = "/donationWebview";

  const DonationWebview({super.key});

  @override
  State<DonationWebview> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<DonationWebview> {
  late final WebViewController _controller;
  bool _loading = true;
  String? token;

  @override
  void initState() {
    controllerInitialization();
    super.initState();
  }

  controllerInitialization() async {
    token = await localStoreSRF.getString('token');
    setState(() {});

    _controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams())
      ..setNavigationDelegate(NavigationDelegate(
          onPageFinished: (_) => setState(() {
                _loading = false;
              })))
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse("https://www.tevini.co.uk/api/make-donation"),
          headers: {'Authorization': 'Bearer $token'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text('Tevini',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true),
      body: Stack(children: [
        _loading || token == null
            ? const Center(child: CircularProgressIndicator())
            : WebViewWidget(controller: _controller),
      ]),
    );
  }
}
