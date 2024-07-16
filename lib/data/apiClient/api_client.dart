import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/values/app_config.dart';
import '../../main.dart';
import '../app_getstorages.dart';
import '../helper.dart';
import '../snackbar.dart';
import '/../pk.dart';

class ApiClient {
  late Dio _dio;

  ApiClient({int? connectTimeout, int? receiveTimeout}) {
    print('ApiClient.ApiClient');
    _dio = Dio();
    _dio.options.connectTimeout =
        Duration(milliseconds: connectTimeout ?? 60000); //1000 = 1s
    _dio.options.receiveTimeout =
        Duration(milliseconds: receiveTimeout ?? 60000);
  }

  void endConnection() => _dio.close(force: true);

  Future<dio.Response?> connectionNew({
    required String API_TYPE,
    required String REQUEST_TYPE,
    required Map<String, dynamic> REQUEST_DATA,
    required Map<String, dynamic> PARAM,
    required String apiType,
    String? apiUrl,
    List<File>? imageFileList,
    bool enableLoading = true,
    Map<String, dynamic>? customheader,
    String? successMessage,
    String? successMessageKey,
    String? errorMessage,
  }) async {
    dio.FormData formData = dio.FormData();

    dio.Response? response;
    String url = '';

    if (apiUrl == null) {
    } else {
      url = apiUrl;
    }


    if(API_TYPE=="STANDING"){
      dio.FormData.fromMap(REQUEST_DATA);
    }

    Map<String, dynamic> header = customheader ??
        <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Access-Control-Allow-Origin': '*',
        };

    if (imageFileList != null) {
      formData.files.addAll(
        imageFileList
            .map(
              (element) => MapEntry(
                'image',
                dio.MultipartFile.fromFileSync(
                  element.path,
                  contentType: MediaType.parse('image/*'),
                  filename: 'image.jpg',
                ),
              ),
            )
            .toList(),
      );
    }


    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        if (enableLoading) showloader();

        if (apiType == 'GET') {
          print('ApiClient.connection ??? GET ');

          response = await _dio.get(
            url,
            options: dio.Options(headers: header),
          );
          print('ApiClient.connection Header ${customheader}');
          print('ApiClient.connection Make ${jsonEncode(REQUEST_DATA)}');
          print('ApiClient.connection ${response.statusCode}');
        //  print('ApiClient.connection >>>>> ${response.data}');
          print('url : ${url}');
        } else {
          print('url : ${url}');
          print('ApiClient.connection POST ');

          response = await _dio.post(
            url,
            data: REQUEST_DATA,// formData,

            options: dio.Options(headers: header),
          );
        }

        print('ApiClient.connection ???? $url');
        print('ApiClient.connection code ???? ${response.statusCode}');
        print('ApiClient.connection data ???? ${response.data}');

        if (enableLoading) loaderDismiss();
      } on DioException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = '';
        debugPrint(e.toString());
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = e.message ?? 'Connection timeout';
        }
        if (e.type == DioExceptionType.sendTimeout) {
          errorMessage = e.message ?? 'Send timeout';
        }
        if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = e.message ?? 'Receive timeout';
        }
        if (e.type == DioExceptionType.badCertificate) {
          errorMessage = e.message ?? 'Bad certificate';
        }
        if (e.type == DioExceptionType.badResponse) {
          errorMessage = e.message ?? 'Bad response';
        }
        if (e.type == DioExceptionType.cancel) {
          errorMessage = e.message ?? 'Your request is cancled';
        }
        if (e.type == DioExceptionType.connectionError) {
          errorMessage = e.message ?? 'Connection error';
        }
        if (e.type == DioExceptionType.unknown) {
          errorMessage = e.message ?? 'Unknown error';
        }
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } on SocketException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.message;
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.toString();
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      }
      final Map<String, dynamic> mapdata = response.data;
      if (response.statusCode == 200) {
        return response;
      }
      else {
          //Error Response (error provided by REST API)
          if (errorMessage != null) {
            //Showing errror provided by error message
            errorSnack(errorMessage);
          } else {
              errorSnack(mapdata['response']['message']);
            }
          return null;
      }
    } else {
      alertSnack('Sorry, You are not connected with mobile/wifi network');
    }
    return null;
  }

  Future<dio.Response?> connection({
    required String API_TYPE,
    required String REQUEST_TYPE,
    required Map<String, String> REQUEST_DATA,
    required Map<String, dynamic> PARAM,
    required String apiType,
    String? apiUrl,
    List<File>? imageFileList,
    bool enableLoading = true,
    Map<String, dynamic>? customheader,
    String? successMessage,
    String? successMessageKey,
    String? errorMessage,
  }) async {
    dio.FormData formData = dio.FormData();

    dio.Response? response;
    String url = '';

    if (apiUrl == null) {
    } else {
      url = apiUrl;
    }


    Map<String, dynamic> header = customheader ??
        <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Access-Control-Allow-Origin': '*',
        };

    if (imageFileList != null) {
      formData.files.addAll(
        imageFileList
            .map(
              (element) => MapEntry(
            'image',
            dio.MultipartFile.fromFileSync(
              element.path,
              contentType: MediaType.parse('image/*'),
              filename: 'image.jpg',
            ),
          ),
        )
            .toList(),
      );
    }

    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        if (enableLoading) showloader();

        if (apiType == 'GET') {
          print('ApiClient.connection ??? GET ');

          response = await _dio.get(
            url,
            options: dio.Options(headers: header),
          );

          print('ApiClient.connection ${response.statusCode}');
         // print('ApiClient.connection >>>>> ${response.data}');
        } else {


          print('ApiClient.connection POST ');
          response = await _dio.post(
            url,
            data: REQUEST_DATA,// formData,

            options: dio.Options(headers: header),
          );
        }

        print('ApiClient.connection ???? $url');


        if (enableLoading) loaderDismiss();
      } on DioException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = '';
        debugPrint(e.toString());
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = e.message ?? 'Connection timeout';
        }
        if (e.type == DioExceptionType.sendTimeout) {
          errorMessage = e.message ?? 'Send timeout';
        }
        if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = e.message ?? 'Receive timeout';
        }
        if (e.type == DioExceptionType.badCertificate) {
          errorMessage = e.message ?? 'Bad certificate';
        }
        if (e.type == DioExceptionType.badResponse) {
          errorMessage = e.message ?? 'Bad response';
        }
        if (e.type == DioExceptionType.cancel) {
          errorMessage = e.message ?? 'Your request is cancled';
        }
        if (e.type == DioExceptionType.connectionError) {
          errorMessage = e.message ?? 'Connection error';
        }
        if (e.type == DioExceptionType.unknown) {
          errorMessage = e.message ?? 'Unknown error';
        }
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } on SocketException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.message;
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.toString();
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      }
      final Map<String, dynamic> mapdata = response.data;
      if (response.statusCode == 200) {
        return response;
      }
      else {
        //Error Response (error provided by REST API)
        if (errorMessage != null) {
          //Showing errror provided by error message
          errorSnack(errorMessage);
        } else {
          errorSnack(mapdata['response']['message']);
        }
        return null;
      }
    } else {
      alertSnack('Sorry, You are not connected with mobile/wifi network');
    }
    return null;
  }


  ///---------------------------- Login --------------


  Future<dio.Response?> connectionLogin({
    required String API_TYPE,
    required String REQUEST_TYPE,
    required Map<String, String> REQUEST_DATA,
    required Map<String, dynamic> PARAM,
    required String apiType,
    String? apiUrl,
    List<File>? imageFileList,
    bool enableLoading = true,
    Map<String, dynamic>? customheader,
    String? successMessage,
    String? successMessageKey,
    String? errorMessage,
  }) async {
    dio.FormData formData = dio.FormData();

    dio.Response? response;
    String url = '';

    if (apiUrl == null) {
    } else {
      url = apiUrl;
    }

    Map<String, dynamic> header = customheader ??
        <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Access-Control-Allow-Origin': '*',
        };


    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        if (enableLoading) showloader();


          print('ApiClient.connection POST >>>>>>>>>>>> ');
          response = await _dio.post(
            url,
            data: REQUEST_DATA,// formData,

            options: dio.Options(headers: header),
          );


        print('ApiClient.connection ???? $url');


        if (enableLoading) loaderDismiss();
      } on DioException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = '';
        debugPrint(e.toString());
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = e.message ?? 'Connection timeout';
        }
        if (e.type == DioExceptionType.sendTimeout) {
          errorMessage = e.message ?? 'Send timeout';
        }
        if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = e.message ?? 'Receive timeout';
        }
        if (e.type == DioExceptionType.badCertificate) {
          errorMessage = e.message ?? 'Bad certificate';
        }
        if (e.type == DioExceptionType.badResponse) {
         // errorSnack('Credential Error. You are not authenticate user..');
          errorMessage = 'Credential Error. You are not authenticate user..';
        }
        if (e.type == DioExceptionType.cancel) {
          errorMessage = e.message ?? 'Your request is cancled';
        }
        if (e.type == DioExceptionType.connectionError) {
          errorMessage = e.message ?? 'Connection error';
        }
        if (e.type == DioExceptionType.unknown) {
          errorMessage = e.message ?? 'Unknown error';
        }
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } on SocketException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.message;
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.toString();
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      }
      final Map<String, dynamic> mapdata = response.data;
      if (response.statusCode == 200) {
        return response;
      }
      else {
        //Error Response (error provided by REST API)
        if (errorMessage != null) {
          //Showing errror provided by error message
          errorSnack(errorMessage);
        } else {
          errorSnack(mapdata['message']);
        }
        return null;
      }
    } else {
      alertSnack('Sorry, You are not connected with mobile/wifi network');
    }
    return null;
  }

//------------------ ******************* ----------------------
  Future<dio.Response?> uploadProfileImage({
    required String profileImagePath,

    required Map<String, dynamic> PARAM,
    required String? tokenValue,
    String? apiUrl,
    List<File>? imageFileList,
    bool enableLoading = true,
    Map<String, dynamic>? customheader,
    String? successMessage,
    String? successMessageKey,
    String? errorMessage,
  }) async {
    dio.FormData formData = dio.FormData();

    dio.Response? response;
    String url = '';

    if (apiUrl == null) {
    } else {
      url = apiUrl;
    }




    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        Map<String,dynamic> headToken={
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenValue'
        };

        if (enableLoading) showloader();


        print('ApiClient.connection POST >>>>>>>>>>>> ');
        FormData formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(profileImagePath),
        });

        var res=await _dio.post(url, data: formData, options: dio.Options(headers: headToken),);
        print('res :${res.statusCode}');
        print('res :${res.statusMessage}');
        print('res :${res.data}');


        print('ApiClient.connection ???? $url');


        if (enableLoading) loaderDismiss();
      } on DioException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = '';
        debugPrint(e.toString());
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = e.message ?? 'Connection timeout';
        }
        if (e.type == DioExceptionType.sendTimeout) {
          errorMessage = e.message ?? 'Send timeout';
        }
        if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = e.message ?? 'Receive timeout';
        }
        if (e.type == DioExceptionType.badCertificate) {
          errorMessage = e.message ?? 'Bad certificate';
        }
        if (e.type == DioExceptionType.badResponse) {
          // errorSnack('Credential Error. You are not authenticate user..');
          errorMessage = '';
        }
        if (e.type == DioExceptionType.cancel) {
          errorMessage = e.message ?? 'Your request is cancled';
        }
        if (e.type == DioExceptionType.connectionError) {
          errorMessage = e.message ?? 'Connection error';
        }
        if (e.type == DioExceptionType.unknown) {
          errorMessage = e.message ?? 'Unknown error';
        }
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } on SocketException catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.message;
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      } catch (e) {
        if (enableLoading) loaderDismiss();
        String errorMessage = e.toString();
        debugPrint(errorMessage);
        errorSnack(errorMessage);
        return null;
      }

    } else {
      alertSnack('Sorry, You are not connected with mobile/wifi network');
    }
    return null;
  }

  Future<void> uploadImage(String imagePath ) async {


    try {
      Dio dio1 = Dio();
      var token = await localStoreSRF.getString('token');
      print('token $token');

      var headToken1={
        //'Content-Type': 'application/json',
      //'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      };
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imagePath,
            filename: imagePath.split("/").last),
      });

      Response response = await dio1.post("https://www.tevini.co.uk/api/profile-image", data: formData,options: dio.Options(headers: headToken1));

      if (response.statusCode == 302) {
        // Handle redirection
        String redirectUrl = response.headers.toString();
        print("Redirect URL: $redirectUrl");
      } else {
        // Handle other status codes
        print("Unexpected status code: ${response.statusCode}");
      }
      // Handle response from server
      print(response.statusCode);
      print(response.statusMessage);
      print(response.data);
    } catch (e) {
      print("Error uploading image: $e");
    }
  }


  Future<void> downloadFile(String attachmentName,
      {required String saveFileName}) async {
    final String savePath = await _getFilePath(saveFileName) ?? '';
    debugPrint('savePath = $savePath');
    if (savePath.isEmpty) {
      errorSnack('Error getting save path');
      return;
    }

    try {
      loader();
      await _dio.download(
        'url',
        savePath,
        deleteOnError: true,
        onReceiveProgress: (rcv, total) {
          if (total != -1) {
            loaderDismiss();
            EasyLoading.showProgress(rcv / total);
          }
        },
      );
      loaderDismiss();
      successSnack('Saved file at = $savePath');
      OpenFile.open(savePath);
    } catch (e) {
      debugPrint(e.toString());
    }
  }



  Future<Map<String, dynamic>?> getData(String url) async {
    dio.Response<dynamic> response = await _dio.get(url);
    Map<String, dynamic>? data = response.data;
    if (data != null) {
      return data;
    }
    return null;
  }

 /* Future<void> uploadProfileImage(String imagePath,String token) async {
    try {

      Map<String,dynamic> headToken={
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath),
      });

      var res=await _dio.post('https://www.tevini.co.uk/api/profile', data: formData, options: dio.Options(headers: headToken),);
      print('res :${res.statusCode}');
      print('res :${res.statusMessage}');
      print('res :${res.data}');
    } catch (e) {
      print('Error uploading profile image: $e');
      throw e;
    }
  }*/
}

Future<String?> _getFilePath(String uniqueFileName) async {
  String path = '';
  if (GetPlatform.isAndroid) {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      path = '/storage/emulated/0/Download/$uniqueFileName';
    } else {
      errorSnack('Error granting permission');
      return '';
    }
  }
  if (GetPlatform.isIOS) {
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/$uniqueFileName';
  }
  return path;
}
