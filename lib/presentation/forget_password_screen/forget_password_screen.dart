import 'package:webview_flutter/webview_flutter.dart';

import 'controller/forget_password_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_elevated_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ForgetPasswordScreen extends GetWidget<ForgetPasswordController> {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,

        appBar: AppBar(title: Text('dfdfdfd'),),
        body:


        Form(
            key: _formKey,
            child: SizedBox(
                height: 1105.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.v),
                          decoration: AppDecoration.fillPrimary,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomAppBar(
                                    height: 20.v,
                                    leadingWidth: double.maxFinite,
                                    leading: AppbarImage(
                                        svgPath: ImageConstant
                                            .imgArrowleftWhiteA700,
                                        margin: EdgeInsets.only(
                                            left: 32.h, right: 372.h,

                                        ),
                                        onTap: () {
                                          onTapArrowleftone();
                                        })),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 146.h, vertical: 70.v),
                                  decoration: AppDecoration.fillPrimary,
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgNewlogo12,
                                      height: 41.v,
                                      color: Colors.white,
                                      width: 136.h),
                                ),
                                SizedBox(height: 14.v)
                              ]))),

                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 28.h, top: 200.v, right: 28.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.h, vertical: 20.v),
                          decoration: AppDecoration.outlineGray.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.roundedBorder12),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text("lbl_forget_password".tr,
                                        style: theme
                                            .textTheme.headlineMedium)),
                                SizedBox(height: 5.v),
                                Text("lbl_email".tr,
                                    style: theme.textTheme.titleMedium),
                                SizedBox(height: 3.v),
                                CustomTextFormField(
                                    controller: controller.emailController,
                                    hintText: "msg_enter_your_email".tr,
                                    hintStyle: CustomTextStyles
                                        .labelLargeErrorContainer,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    }),
                                SizedBox(height: 59.v)
                              ]))),
                  CustomElevatedButton(
                      width: 262.h,
                      text: "msg_send_password_reset".tr,
                      margin: EdgeInsets.only(top: 374.v),
                      alignment: Alignment.topCenter)
                ]))));
  }

  onTapArrowleftone() {
    Get.back();
  }
}


class ConnectAccountPage extends StatefulWidget {
  static const id = 'ConnectAccountPage';

  @override
  State<ConnectAccountPage> createState() => _ConnectAccountPageState();
}

class _ConnectAccountPageState extends State<ConnectAccountPage> {
  @override
  void initState() {
    super.initState();
  }

  WebViewController createWebviewControler(
      BuildContext context, dynamic initialUrl) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
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
    return SafeArea(
      child: WebViewWidget(
        controller: createWebviewControler(
            context, 'https://pub.dev/packages/webview_flutter'),
      ),
    );
  }
}