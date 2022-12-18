import 'dart:async';
import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/spref.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/widget_reusable/error_request_api/dialog_bad_request.dart';
import 'package:agent_mobile_app/widget_reusable/error_request_api/dialog_timeout_api.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApi {
  final Dio _dio = Dio();

  Future get({required String url, Map<String, dynamic>? parameter}) async {
    try {
      final response = await _dio
          .get(ApiUrl.proBaseUrl + url,
              queryParameters: parameter,
              options: Options(
                  headers: {'Authorization': 'Bearer ${await getToken()}'}))
          .timeout(const Duration(minutes: 1));
      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 500) {
        widgetBadRequest(contextNav.currentContext!);
      } else {
        return e.response!.data;
      }
    } on TimeoutException {
      dialogTimeOutService(contextNav.currentContext!);
    }
  }

  Future postData(
      {required String urlPath,
      required dynamic body,
      Map<String, dynamic>? parameter}) async {
    try {
      final Response response = await _dio.post(ApiUrl.proBaseUrl + urlPath,
          data: body,
          queryParameters: parameter,
          options: Options(
              headers: {'Authorization': 'Bearer ${await getToken()}'}));
      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 500) {
        widgetBadRequest(contextNav.currentContext!);
      } else {
        return e.response!.data;
      }
    } on TimeoutException {
      dialogTimeOutService(contextNav.currentContext!);
    }
  }

  Future put(
      {required String urlPath,
      required dynamic body,
      Map<String, dynamic>? parameter}) async {
    try {
      final Response response = await _dio.put(ApiUrl.proBaseUrl + urlPath,
          data: body,
          queryParameters: parameter,
          options: Options(
              headers: {'Authorization': 'Bearer ${await getToken()}'}));

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 500) {
        widgetBadRequest(contextNav.currentContext!);
      } else {
        return e.response!.data;
      }
    } on TimeoutException {
      dialogTimeOutService(contextNav.currentContext!);
    }
  }

  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString(SPrefKey.token);
    return token;
  }

  Future getRefreshToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? refreshToken = pref.getString(SPrefKey.refreshToken);
    return refreshToken;
  }
}
