

import 'key.dart';

class AppUrl {
  static const String baseUrl = 'https://openexchangerates.org/api/';
  static const String currenciesUrl = '${baseUrl}currencies.json?app_id=$key';
  static const String ratesUrl = '${baseUrl}latest.json?base=USD&app_id=$key';
  static const String donationRequest = 'https://www.tevini.co.uk/api/dashboard';
  static const String closeLink = 'https://www.tevini.co.uk/api/close-a-link';
}