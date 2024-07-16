import 'app_config.dart';

class ApiURL {
  ApiURL._();


  /// testing url
  static const String globalUrl1 = 'https://www.app.tevinicard.co.uk/';
  static const String baseApiUrl1 = 'https://www.app.tevinicard.co.uk/api/';
  /// live url
  static const String globalUrl = 'https://www.tevini.co.uk/';
  static const String baseApiUrl = 'https://www.tevini.co.uk/api/';

  ///------------------- Authentication  url path -----------------------
  static const String loginUrl = '${baseApiUrl}login';
  static const String loginCharityUrl = '${baseApiUrl}charity_login';
  static const String registerUrl = '${baseApiUrl}signup';
  static const String updateProfileUrl = '${baseApiUrl}profile';
  static const String updateProfileImageUrl = '${baseApiUrl}profile-image';

  static const String getDashboardUrl = '${baseApiUrl}dashboard';
  static const String getAllCharityUrl = '${baseApiUrl}get-all-charity';
  static const String getDonationRecordUrl = '${baseApiUrl}donation-record';
  static const String getDonationRecordDetailsUrl = '${baseApiUrl}on-off-donation-details';
  static const String getStandOrderRecordUrl = '${baseApiUrl}standing-order-record';
  static const String getWaitingVoucherRecordUrl = '${baseApiUrl}process-voucher';
  static const String getOrderHistoryUrl = '${baseApiUrl}order-history';

  static const String getProcessVoucherUrl = '${baseApiUrl}process-voucher';
  static const String voucherStoreUrl = '${baseApiUrl}voucher-store';
  static const String getOrderVoucherBookUrl = '${baseApiUrl}order-voucher-book';
  static const String getTransactionViewUrl = '${baseApiUrl}transaction-view';
  static const String donationDetailsByIdUrl = '${baseApiUrl}donation-details/';

  /// POST
  static const String makeDonationUrl = '${baseApiUrl}make-donation';
  static const String contactSubmitUrl = '${baseApiUrl}contact-submit';
  static const String oneOffDonationUrl = '${baseApiUrl}one-off-donation';
  static const String donationCalculatorUrl = '${baseApiUrl}donation-calculator';
  static const String otherExternalDonationUrl = '${baseApiUrl}other-donation-store';
  static const String getDonationCalculatorUrl = '${baseApiUrl}donation-calculation';
  static const String standingDonationUrl = '${baseApiUrl}standing-donation';
  static const String donationCalculatorAddUpdateUrl = '${baseApiUrl}donation-calculator-update';

   /// Switch Off
  static const String regularIncomeDonationOnOffUrl = '${baseApiUrl}active-donation-details';
  /// Switch On
  static const String standingDonationOnOffUrl = '${baseApiUrl}active-standingdonation';

  /// User Profile Information
  static const String getUserProfileUrl = '${baseApiUrl}get-user-details';
  static const String donorChangePasswordUrl = '${baseApiUrl}get-user-details';
  static const String updateUserProfileUrl = '${baseApiUrl}get-user-details';


  ///------------------- Web View Web Site Url -------------
  static const String teviniCardUrlWebView = '${globalUrl}password/reset';
  static const String teviniForgetPasswordUrlWebView = '${globalUrl}user/card-service';


  /// TDF ---------

  static const String transferTDFUrl = '${baseApiUrl}tdf-transaction';
  static const String createTransferTDFUrl = '${baseApiUrl}transfer-to-tdf';

  /// Stripe

  static const String createStripeTopUpUrl = '${baseApiUrl}stripe-top-up';

  /// Awaiting Voucher
  static const String awaitingVoucherCancelUrl = '${baseApiUrl}waiting-cancelBydonor';
  static const String awaitingVoucherConfirmUrl = '${baseApiUrl}waiting-completeBydonor';


  ///--------- Charity ---------------

  static const String charityUrgentRequestUrl = '${baseApiUrl}urgent-request';
  static const String charityCreateLinkUrl = '${baseApiUrl}create-a-link';
  static const String charityProfileUpdateUrl = '${baseApiUrl}charity-profile-update';
  static const String charityTransactionUrl = '${baseApiUrl}charity-transaction/';
  static const String getCharityProfileUrl = '${baseApiUrl}charity-profile/';
  static const String getCharityDashboardUrl = '${baseApiUrl}charity-dashboard/';
  static const String getAllDonorUrl = '${baseApiUrl}all-donor';

  static const String updateCharityProfileUrl = '${baseApiUrl}charity-profile-update';
  static const String urgentRequestUrl = '${baseApiUrl}urgent-request';
}
