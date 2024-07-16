import 'dart:convert';
import 'dart:convert';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:tenvini/data/models/home/dashboard_model.dart';

import '../../core/values/app_url.dart';
import '../../main.dart';

class Repo {
  @override
  void onInit() {}



  Future<bool> registerRepo({required Map rgMapBody}) async {
    print(' rgMapBody $rgMapBody');
    const String apiUrl = ApiURL.registerUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response =
          await http.post(Uri.parse(apiUrl), body: rgMapBody);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      if (response.statusCode == 200) {
        return true;
      }
      else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }

  ///------------- Dashboard ------------
  Future getDashboardRepo() async {
    List<Alltransaction> list = [];
    print('Repo.getDashboardRepo');
    String? token = await localStoreSRF.getString('token');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //   print(token);
    const String apiUrl = ApiURL.getDashboardUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return json.decode(response.body);
     /* Map<String, dynamic> mapData = jsonDecode(response.body);
      print('Dashboard Map status code  :: ${response.statusCode}');
      print('Dashboard Map Data :: ${mapData}');

      print('Repo.getDashboardRepo ${mapData['tamount'][0]['source']}');
      if (mapData != null) {
        for (var data in mapData['tamount']) {
          list.add(Alltransaction.fromJson(data));
        }

        print(list);*/
    //  }


    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    print('Repo.getDashboardRepo ${list.length}');
    return list;
  }

  Future<bool> getAllCharityRepo() async {
    print('Repo.getAllCharityRepo');
    String? token = await localStoreSRF.getString('token');
    //  print(token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    const String apiUrl = ApiURL.getAllCharityUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }

  Future getDonationRecordRepo() async {
    print('Repo.getDonationRecordRepo');
    String? token = await localStoreSRF.getString('token');
    // print(token);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    const String apiUrl = ApiURL.getDonationRecordUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.post(Uri.parse(apiUrl), headers: headers);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
  }

  Future<bool> getStandOrderRecordRepo() async {
    print('Repo.getStandOrderRecordRepo');
    String? token = await localStoreSRF.getString('token');
    //  print(token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    const String apiUrl = ApiURL.getStandOrderRecordUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }

  Future<bool> getOrderHistoryRepo() async {
    print('Repo.getOrderHistoryRepo');
    String? token = await localStoreSRF.getString('token');
    // print(token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    const String apiUrl = ApiURL.getOrderHistoryUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.post(Uri.parse(apiUrl), headers: headers);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }

  Future<bool> getProcessVoucherRepo() async {
    print('Repo.getProcessVoucherRepo');
    String? token = await localStoreSRF.getString('token');
    //print(token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    const String apiUrl = ApiURL.getProcessVoucherUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }

  Future<bool> getTransactionViewRepo() async {
    print('Repo.getTransactionViewRepo');
    String? token = await localStoreSRF.getString('token');
    // print(token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    const String apiUrl = ApiURL.getTransactionViewUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.post(Uri.parse(apiUrl), headers: headers);

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
    return false;
  }
}
