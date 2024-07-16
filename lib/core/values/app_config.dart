class AppConfig {
  AppConfig._();
 //AppConfig.baseUrl
 //AppConfig.globalUrl
  /// dev version
 // static const String globalUrl = "https://dev.k1receipt.com";
  static const String globalUrl = "https://k1receipt.com";

  /// dev version
 // static const String baseUrl = "https://dev.k1receipt.com";
  /// live version
  static const String baseUrl = "https://k1receipt.com/api/";
  static const String baseImageUrl = "https://k1receipt.com/expense_image/";

  /// End Point
  static const String planListAPI = "${baseUrl}get-plan-list";
  static const String googleAuthAPI = "${baseUrl}LoginWithThirdPartyApi";
  static const String loginAuthAPI = "${baseUrl}user_login";
  static const String changePasswordAPI = "${baseUrl}change_password";
  static const String getProfileAPI = "${baseUrl}profile/"; //$d_id'
  static const String updateProfileAPI = "${baseUrl}update/"; //$d_id'
  static const String paymentAPI = "${baseUrl}pay";
  static const String categoryListAPI = "${baseUrl}category/withbudgetList/";

  static const String creteCategoryAPI = '${baseUrl}category/budget/create';
  static const String creteSubCategoryAPI = '${baseUrl}subcategory/budget/create';
  static const String creteExpenseAPI = '${baseUrl}expense/add';
  static const String codeCombinationAPI = "${baseUrl}code_combination";
  static const String usageInformationAPI = "${baseUrl}usage-information/?";//$d_id
  static const String googleProfileUpdateAPI = "${baseUrl}googleLogin_profile_update";

}
