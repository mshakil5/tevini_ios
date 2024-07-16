import 'package:tenvini/app/modules/charity_link/views/charity_link_view.dart';
import 'package:tenvini/app/modules/charity_profile/bindings/charity_profile_binding.dart';
import 'package:tenvini/app/modules/charity_profile/views/charity_profile_view.dart';
import 'package:tenvini/app/modules/charity_sign_up_screen/binding/charity_sign_up_binding.dart';
import 'package:tenvini/app/modules/charity_sign_up_screen/charity_sign_up_screen.dart';
import 'package:tenvini/app/modules/forget_password_viewweb/bindings/forget_password_viewweb_binding.dart';
import 'package:tenvini/app/modules/tivini_card_viewweb/bindings/tivini_card_webview_binding.dart';
import 'package:tenvini/app/modules/tivini_card_viewweb/views/tivini_card_webview.dart';
import 'package:tenvini/presentation/donor_change_password/bindings/donor_change_password_binding.dart';
import 'package:tenvini/presentation/donor_change_password/views/donor_change_password_view.dart';
import 'package:tenvini/presentation/single_standing_donation_records/views/single_standing_donation_records_view.dart';
import 'package:tenvini/presentation/splash_secreen_screen/splash_secreen_screen.dart';
import 'package:tenvini/presentation/splash_secreen_screen/binding/splash_secreen_binding.dart';
import 'package:tenvini/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:tenvini/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:tenvini/presentation/forget_password_screen/forget_password_screen.dart';
import 'package:tenvini/presentation/forget_password_screen/binding/forget_password_binding.dart';
import 'package:tenvini/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:tenvini/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:tenvini/presentation/home_container_screen/home_container_screen.dart';
import 'package:tenvini/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:tenvini/presentation/order_a_card_tab_container_screen/order_a_card_tab_container_screen.dart';
import 'package:tenvini/presentation/order_a_card_tab_container_screen/binding/order_a_card_tab_container_binding.dart';
import 'package:tenvini/presentation/order_a_card_one_screen/order_a_card_one_screen.dart';
import 'package:tenvini/presentation/order_a_card_one_screen/binding/order_a_card_one_binding.dart';
import 'package:tenvini/presentation/transafer_tdf_screen/transfer_tdf_screen.dart';
import 'package:tenvini/presentation/update_cardholder_screen/update_cardholder_screen.dart';
import 'package:tenvini/presentation/update_cardholder_screen/binding/update_cardholder_binding.dart';
import 'package:tenvini/presentation/mobile_verification_screen/mobile_verification_screen.dart';
import 'package:tenvini/presentation/mobile_verification_screen/binding/mobile_verification_binding.dart';
import 'package:tenvini/presentation/card_activation_screen/card_activation_screen.dart';
import 'package:tenvini/presentation/card_activation_screen/binding/card_activation_binding.dart';
import 'package:tenvini/presentation/get_pin_tab_container_screen/get_pin_tab_container_screen.dart';
import 'package:tenvini/presentation/get_pin_tab_container_screen/binding/get_pin_tab_container_binding.dart';
import 'package:tenvini/presentation/get_pin_and_change_the_pin_screen/get_pin_and_change_the_pin_screen.dart';
import 'package:tenvini/presentation/get_pin_and_change_the_pin_screen/binding/get_pin_and_change_the_pin_binding.dart';
import 'package:tenvini/presentation/change_card_status_screen/change_card_status_screen.dart';
import 'package:tenvini/presentation/change_card_status_screen/binding/change_card_status_binding.dart';
import 'package:tenvini/presentation/make_a_donation_screen/make_a_donation_screen.dart';
import 'package:tenvini/presentation/make_a_donation_screen/binding/make_a_donation_binding.dart';
import 'package:tenvini/presentation/make_a_donation_one_screen/make_a_donation_one_screen.dart';
import 'package:tenvini/presentation/make_a_donation_one_screen/binding/make_a_donation_one_binding.dart';
import 'package:tenvini/presentation/donation_record_screen/donation_record_screen.dart';
import 'package:tenvini/presentation/donation_record_screen/binding/donation_record_binding.dart';
import 'package:tenvini/presentation/standing_donation_records_screen/standing_donation_records_screen.dart';
import 'package:tenvini/presentation/standing_donation_records_screen/binding/standing_donation_records_binding.dart';
import 'package:tenvini/presentation/frame_18706_screen/frame_18706_screen.dart';
import 'package:tenvini/presentation/frame_18706_screen/binding/frame_18706_binding.dart';
import 'package:tenvini/presentation/frame_18705_screen/frame_18705_screen.dart';
import 'package:tenvini/presentation/frame_18705_screen/binding/frame_18705_binding.dart';
import 'package:tenvini/presentation/order_voucher_books_screen/order_voucher_books_screen.dart';
import 'package:tenvini/presentation/order_voucher_books_screen/binding/order_voucher_books_binding.dart';
import 'package:tenvini/presentation/order_record_screen/order_record_screen.dart';
import 'package:tenvini/presentation/order_record_screen/binding/order_record_binding.dart';
import 'package:tenvini/presentation/wating_voucher_records_screen/wating_voucher_records_screen.dart';
import 'package:tenvini/presentation/wating_voucher_records_screen/binding/wating_voucher_records_binding.dart';
import 'package:tenvini/presentation/frame_18708_screen/frame_18708_screen.dart';
import 'package:tenvini/presentation/frame_18708_screen/binding/frame_18708_binding.dart';
import 'package:tenvini/presentation/all_transaction_screen/all_transaction_screen.dart';
import 'package:tenvini/presentation/all_transaction_screen/binding/all_transaction_binding.dart';
import 'package:tenvini/presentation/money_in_screen/money_in_screen.dart';
import 'package:tenvini/presentation/money_in_screen/binding/money_in_binding.dart';
import 'package:tenvini/presentation/money_out_screen/money_out_screen.dart';
import 'package:tenvini/presentation/money_out_screen/binding/money_out_binding.dart';
import 'package:tenvini/presentation/pending_transaction_screen/pending_transaction_screen.dart';
import 'package:tenvini/presentation/pending_transaction_screen/binding/pending_transaction_binding.dart';
import 'package:tenvini/presentation/maaser_calculator_screen/maaser_calculator_screen.dart';
import 'package:tenvini/presentation/maaser_calculator_screen/binding/maaser_calculator_binding.dart';
import 'package:tenvini/presentation/contact_top_up_screen/contact_top_up_screen.dart';
import 'package:tenvini/presentation/contact_top_up_screen/binding/contact_top_up_binding.dart';
import 'package:tenvini/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:tenvini/presentation/my_profile_screen/binding/my_profile_binding.dart';
import 'package:tenvini/presentation/notification_screen/notification_screen.dart';
import 'package:tenvini/presentation/notification_screen/binding/notification_binding.dart';
import 'package:tenvini/presentation/frame_18709_screen/frame_18709_screen.dart';
import 'package:tenvini/presentation/frame_18709_screen/binding/frame_18709_binding.dart';
import 'package:tenvini/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:tenvini/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../app/modules/charity_change_password/bindings/chariy_change_password_binding.dart';
import '../app/modules/charity_change_password/views/charity_change_password_view.dart';
import '../app/modules/charity_dashboard/bindings/charity_dashboard_binding.dart';
import '../app/modules/charity_dashboard/views/charity_dashboard_view.dart';
import '../app/modules/charity_link/bindings/charity_link_binding.dart';
import '../app/modules/charity_transction/bindings/charity_transction_binding.dart';
import '../app/modules/charity_transction/views/charity_transction_view.dart';
import '../app/modules/forget_password_viewweb/views/forget_password_viewweb_view.dart';
import '../main.dart';
import '../presentation/donation_record_screen_details/binding/donation_record_binding.dart';
import '../presentation/donation_record_screen_details/donation_record__details_screen.dart';
import '../presentation/order_a_card_page/binding/order_a_card_binding.dart';
import '../presentation/order_a_card_page/order_a_card_page.dart';
import '../presentation/single_standing_donation_records/bindings/single_standing_donation_records_binding.dart';
import '../presentation/transafer_tdf_screen/binding/transfer_tdf_binding.dart';

class AppRoutes {
  static const String splashSecreenScreen = '/splash_secreen_screen';

  static const String signInScreen = '/sign_in_screen';
  static const String forget_password = '/forget_password';
  static const String tiviniCardWebView = '/tiviniCardWebView';

  static const String forgetPasswordScreen = '/forget_password_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String orderACardPage = '/order_a_card_page';

  static const String orderACardTabContainerScreen =
      '/order_a_card_tab_container_screen';

  static const String orderACardOneScreen = '/order_a_card_one_screen';

  static const String updateCardholderScreen = '/update_cardholder_screen';

  static const String mobileVerificationScreen = '/mobile_verification_screen';

  static const String cardActivationScreen = '/card_activation_screen';

  static const String getPinPage = '/get_pin_page';

  static const String getPinTabContainerScreen =
      '/get_pin_tab_container_screen';

  static const String getPinAndChangeThePinScreen =
      '/get_pin_and_change_the_pin_screen';

  static const String changeCardStatusScreen = '/change_card_status_screen';

  static const String makeADonationScreen = '/make_a_donation_screen';

  static const String makeADonationOneScreen = '/make_a_donation_one_screen';

  static const String transferTDFScreen = '/transferTDFScreen';
  static const String donationRecordScreen = '/donation_record_screen';
  static const String donationRecordDetailsScreen =
      '/donation_record_screen_details';

  static const String standingDonationRecordsScreen =
      '/standing_donation_records_screen';

  static const String frame18706Screen = '/frame_18706_screen';

  static const String frame18705Screen = '/frame_18705_screen';

  static const String orderVoucherBooksScreen = '/order_voucher_books_screen';

  static const String orderRecordScreen = '/order_record_screen';

  static const String watingVoucherRecordsScreen =
      '/wating_voucher_records_screen';

  static const String frame18708Screen = '/frame_18708_screen';

  static const String allTransactionScreen = '/all_transaction_screen';

  static const String moneyInScreen = '/money_in_screen';

  static const String moneyOutScreen = '/money_out_screen';

  static const String pendingTransactionScreen = '/pending_transaction_screen';

  static const String maaserCalculatorScreen = '/maaser_calculator_screen';

  static const String contactTopUpScreen = '/contact_top_up_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String notificationScreen = '/notification_screen';

  static const String frame18709Screen = '/frame_18709_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String singleStandingDonationRecord =
      '/singleStanding_donationRecords';
  static const String donorChangePassword = '/donorChange_password';

  ///-------------- Charity

  static const String charityDashboard = '/charityDashboard';
  static const String charityLink = '/charityLink';
  static const String charityGetTransaction = '/charityGetTransaction';
  static const String charityProfile = '/charityProfile';
  static const String chariyChangePassword = '/chariyChange_password';
  static const String charitySignUp = '/charitySignUp';

  //static const String initialRoute = '/initialRoute';

  static String initialRoute = localStoreSRF.getString('token') != null && localStoreSRF.getBool('loginRememberStatus') == true
      ? '/home_container_screen'
      :  '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashSecreenScreen,
      page: () => SplashSecreenScreen(),
      bindings: [
        SplashSecreenBinding(),
      ],
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),

    GetPage(
      name: forget_password,
      page: () => ForgetPasswordViewwebView(),
      bindings: [
        ForgetPasswordViewwebBinding(),
      ],
    ),

    /// Tivini Card WebView

    GetPage(
      name: tiviniCardWebView,
      page: () => TiviniCardWebView(),
      bindings: [
        TiviniCardWebViewBinding(),
      ],
    ),

    GetPage(
      name: orderACardPage,
      page: () => OrderACardPage(),
      bindings: [
        OrderACardBinding(),
      ],
    ),

    GetPage(
      name: forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      bindings: [
        ForgetPasswordBinding(),
      ],
    ),

    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: orderACardTabContainerScreen,
      page: () => OrderACardTabContainerScreen(),
      bindings: [
        OrderACardTabContainerBinding(),
      ],
    ),
    GetPage(
      name: orderACardOneScreen,
      page: () => OrderACardOneScreen(),
      bindings: [
        OrderACardOneBinding(),
      ],
    ),
    GetPage(
      name: updateCardholderScreen,
      page: () => UpdateCardholderScreen(),
      bindings: [
        UpdateCardholderBinding(),
      ],
    ),
    GetPage(
      name: mobileVerificationScreen,
      page: () => MobileVerificationScreen(),
      bindings: [
        MobileVerificationBinding(),
      ],
    ),
    GetPage(
      name: cardActivationScreen,
      page: () => CardActivationScreen(),
      bindings: [
        CardActivationBinding(),
      ],
    ),
    GetPage(
      name: getPinTabContainerScreen,
      page: () => GetPinTabContainerScreen(),
      bindings: [
        GetPinTabContainerBinding(),
      ],
    ),
    GetPage(
      name: getPinAndChangeThePinScreen,
      page: () => GetPinAndChangeThePinScreen(),
      bindings: [
        GetPinAndChangeThePinBinding(),
      ],
    ),
    GetPage(
      name: changeCardStatusScreen,
      page: () => ChangeCardStatusScreen(),
      bindings: [
        ChangeCardStatusBinding(),
      ],
    ),
    GetPage(
      name: makeADonationScreen,
      page: () => MakeADonationScreen(),
      bindings: [
        MakeADonationBinding(),
      ],
    ),
    GetPage(
      name: makeADonationOneScreen,
      page: () => MakeADonationOneScreen(),
      bindings: [
        MakeADonationOneBinding(),
      ],
    ),
    GetPage(
      name: donationRecordScreen,
      page: () => DonationRecordScreen(),
      bindings: [
        DonationRecordBinding(),
      ],
    ),
    GetPage(
      name: transferTDFScreen,
      page: () => TransferTDFScreen(),
      bindings: [
        transferTDFBinding(),
      ],
    ),

    GetPage(
      name: donationRecordDetailsScreen,
      page: () => DonationRecordScreenDetails(),
      bindings: [
        DonationRecordDetailsBinding(),
      ],
    ),

    GetPage(
      name: standingDonationRecordsScreen,
      page: () => StandingDonationRecordsScreen(),
      bindings: [
        StandingDonationRecordsBinding(),
      ],
    ),
    GetPage(
      name: frame18706Screen,
      page: () => Frame18706Screen(),
      bindings: [
        Frame18706Binding(),
      ],
    ),
    GetPage(
      name: frame18705Screen,
      page: () => Frame18705Screen(),
      bindings: [
        Frame18705Binding(),
      ],
    ),
    GetPage(
      name: orderVoucherBooksScreen,
      page: () => OrderVoucherBooksScreen(),
      bindings: [
        OrderVoucherBooksBinding(),
      ],
    ),
    GetPage(
      name: orderRecordScreen,
      page: () => OrderRecordScreen(),
      bindings: [
        OrderRecordBinding(),
      ],
    ),
    GetPage(
      name: watingVoucherRecordsScreen,
      page: () => WatingVoucherRecordsScreen(),
      bindings: [
        WatingVoucherRecordsBinding(),
      ],
    ),
    GetPage(
      name: frame18708Screen,
      page: () => Frame18708Screen(),
      bindings: [
        Frame18708Binding(),
      ],
    ),
    GetPage(
      name: allTransactionScreen,
      page: () => AllTransactionScreen(),
      bindings: [
        AllTransactionBinding(),
      ],
    ),
    GetPage(
      name: moneyInScreen,
      page: () => MoneyInScreen(),
      bindings: [
        MoneyInBinding(),
      ],
    ),
    GetPage(
      name: moneyOutScreen,
      page: () => MoneyOutScreen(),
      bindings: [
        MoneyOutBinding(),
      ],
    ),
    GetPage(
      name: pendingTransactionScreen,
      page: () => PendingTransactionScreen(),
      bindings: [
        PendingTransactionBinding(),
      ],
    ),
    GetPage(
      name: maaserCalculatorScreen,
      page: () => MaaserCalculatorScreen(),
      bindings: [
        MaaserCalculatorBinding(),
      ],
    ),
    GetPage(
      name: contactTopUpScreen,
      page: () => ContactTopUpScreen(),
      bindings: [
        ContactTopUpBinding(),
      ],
    ),
    GetPage(
      name: myProfileScreen,
      page: () => MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: frame18709Screen,
      page: () => Frame18709Screen(),
      bindings: [
        Frame18709Binding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashSecreenScreen(),
      bindings: [
        SplashSecreenBinding(),
      ],
    ),

    GetPage(
      name: singleStandingDonationRecord,
      page: () => SingleStandingDonationRecordsView(),
      bindings: [
        SingleStandingDonationRecordsBinding(),
      ],
    ),

    GetPage(
      name: donorChangePassword,
      page: () => DonorChangePasswordView(),
      bindings: [
        DonorChangePasswordBinding(),
      ],
    ),

    ///----------------- Charity --------------

    GetPage(
      name: charitySignUp,
      page: () => CharitySignUpScreen(),
      bindings: [
        CharitySignUpBinding(),
      ],
    ),
    GetPage(
      name: charityDashboard,
      page: () => CharityDashboardView(),
      bindings: [
        CharityDashboardBinding(),
      ],
    ),
    GetPage(
      name: charityLink,
      page: () => CharityLinkView(),
      bindings: [
        CharityLinkBinding(),
      ],
    ),
    GetPage(
      name: charityGetTransaction,
      page: () => CharityTransctionView(),
      bindings: [
        CharityTransctionBinding(),
      ],
    ),

    GetPage(
      name: charityProfile,
      page: () => CharityProfileView(),
      bindings: [
        CharityProfileBinding(),
      ],
    ),

    GetPage(
      name: chariyChangePassword,
      page: () => CharityChangePasswordView(),
      bindings: [
        ChariyChangePasswordBinding(),
      ],
    ),
  ];
}
