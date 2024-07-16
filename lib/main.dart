import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenvini/routes/app_routes.dart';
import 'package:tenvini/theme/theme_helper.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'core/app_export.dart';
import 'core/utils/logger.dart';
import 'localization/app_localization.dart';

import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

late SharedPreferences localStoreSRF;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  //Stripe.publishableKey = StripeConfig.publicKey;
  await GetStorage.init();
  localStoreSRF = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      builder: EasyLoading.init(),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Tevini App',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
     // home: HomeContainerScreen(title:'dfd'),
      //home: ConnectAccountPage()
    );
  }

  openDialog() {
    Get.dialog(
      AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are Yor Sure?'),
            Text('Do you want to exit ?'),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onTap: () {
                      Get.back();
                      //OrderACardTabContainerScreen
                    },
                    text: "lbl_order_a_card".tr,
                    margin: EdgeInsets.only(
                      top: 22.v,
                      bottom: 2.v,
                    ),
                    buttonStyle: CustomButtonStyles.outlineWhiteA,
                  ),
                ),
                Expanded(
                  child: CustomOutlinedButton(
                    onTap: () {
                      if (Platform.isAndroid) {
                        exit(0);
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    text: "lbl_order_a_card".tr,
                    margin: EdgeInsets.only(
                      top: 22.v,
                      bottom: 2.v,
                    ),
                    buttonStyle: CustomButtonStyles.outlineWhiteA,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

