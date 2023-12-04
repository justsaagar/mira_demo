import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart' as gets;
import 'package:gym/app/app/utills/app_utills.dart';
import 'package:gym/routes/route_helper.dart';
import 'package:gym/service/connectivity_service.dart';
import 'package:gym/service/share_preference.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'connectivity_service.dart';

class RestConstants {
  RestConstants._privateConstructor();

  static final RestConstants instance = RestConstants._privateConstructor();

  //     ======================= API baseurl =======================     //
  final String baseUrl = 'https://gym.brainboostinfotech.com/api';

  //     ======================= API EndPoints =======================     //
   final String login = 'login';
   final String signinWithGoogle = 'signinWithGoogle';
   final String register = 'register';
   final String resendOtp = 'resendotp';
   final String verifyRegistrationEmail = 'verifyRegistrationEmail';
   final String updateProfile = 'updateProfile';
   final String forgotPassword = "forgotpwd";
   final String verificationEmailCode = 'verificationEmailCode';
   final String resetPassword = 'resetPwd';
   final String changePassword = 'changePwd';
   final String showProfile = 'showProfile';
   final String updateUserProfile = 'update_Profile';
}

class RestServices {
  RestServices._privateConstructor();

  static final RestServices instance = RestServices._privateConstructor();

  Map<String, String> headers = {'Content-Type': 'application/json'};

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData) {
    print('•••••••••• Network logs ••••••••••\nRequest code --> ${response?.statusCode} : ${response?.request?.url}\nRequest headers --> $requestData\nResponse headers --> ${response?.headers}\nResponse body --> ${response?.body}\n••••••••••••••••••••••••••••••••••');
  }

  Future<String?>? getRestCall({required String? endpoint, String? addOns}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.baseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      String? token = await SharedPrefService.instance.getPrefStringValue(SharedPrefService.instance.authenticationToken);
      if (token != null) headers['Authorization'] = 'Bearer $token';

      Response response = await http.get(requestedUri!, headers: headers);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
        case 400:
        case 401:
        case 422:
          responseData = response.body;
          break;
        case 404:
          gets.Get.toNamed(RouteHelper.getLoginRoute());
          break;
        case 500:
        case 502:
          warningLogs('${response.statusCode}');
          break;
        default:
          warningLogs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      errorLogs('PlatformException in getRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? postRestCall({required String? endpoint, required Map<String, dynamic>? body, String? addOns, bool isFormData = false, bool addToken = true}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }

    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.baseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      infoLogs('Body map --> ${jsonEncode(body)}');
      headers['Content-Type'] = 'application/json';
      if (isFormData) headers.remove('Content-Type');
      String? token = await SharedPrefService.instance.getPrefStringValue(SharedPrefService.instance.authenticationToken);
      if (token != null && addToken) headers['Authorization'] = 'Bearer $token';

      Response response = await http.post(requestedUri!, body: isFormData ? body : jsonEncode(body), headers: headers);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 500:
        case 201:
          responseData = response.body;
          break;
        case 404:
          gets.Get.toNamed(RouteHelper.getLoginRoute());
          break;
        case 400:
        case 401:
        case 502:
          warningLogs('${response.statusCode}');
          break;
        case 403:
          break;
        default:
          warningLogs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      errorLogs('PlatformException in postRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? multiPartRestCall(
      {required String? endpoint,
      required Map<String, String>? body,
      required String? keyName,
      required String? filePath}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = '${RestConstants.instance.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      MultipartRequest request = http.MultipartRequest('POST', requestedUri!);
      headers['Content-Type'] = 'multipart/form-data';
      request.headers.addAll(headers);
      if (body!.isNotEmpty) {
        request.fields.addAll(body);
      }
      if (filePath != null && filePath.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(
            keyName!,
            filePath,

            /// todo contentType: MediaType.parse('image/jpeg'),
          ),
        );
      }
      StreamedResponse responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);

      showRequestAndResponseLogs(response, request.headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 502:
        case 400:
        case 401:
          warningLogs('${response.statusCode}');
          break;
        case 404:
          gets.Get.toNamed(RouteHelper.getLoginRoute());
          break;
        default:
          warningLogs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      errorLogs('PlatformException in multiPartRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? deleteRestCall({required String? endpoint, Map<String, dynamic>? body, String? addOns}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.baseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      headers.remove('Content-Type');
      Response response = await http.delete(requestedUri!, headers: headers, body: body);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 422:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 502:
        case 400:
        case 401:
          warningLogs('${response.statusCode}');
          break;
        case 404:
          gets.Get.toNamed(RouteHelper.getLoginRoute());
          break;
        default:
          warningLogs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      errorLogs('PlatformException in deleteRestCall --> ${e.message}');
    }
    return responseData;
  }
}
