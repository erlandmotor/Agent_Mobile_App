import 'dart:async';
import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/spref.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/widget_reusable/error_request_api/dialog_server_error.dart';
import 'package:agent_mobile_app/widget_reusable/error_request_api/dialog_timeout_api.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApi {
  final Dio _dio = Dio();

  String? token = "";

  Future initialRespondseAPI() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onResponse: onResponse,
        onError: onError,
      ),
    );
  }

  Future<RequestOptions> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer $token';
    return options;
  }

  Future<Response> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    print('====>>>      ' + response.toString());
    return response;
  }

  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    RequestOptions requestOption = error.response!.requestOptions;
    if (error.response!.statusCode == 401) {
      token = await refreshToken();
      if (token != null) {
        requestOption.headers['Authorization'] = 'Bearer $token';
        return _dio.request(
          requestOption.path,
        );
      } else {
        dialogServerError(contextNav.currentContext!);
      }
    } else if (error.type == DioErrorType.sendTimeout) {
      dialogTimeOutService(contextNav.currentContext!);
    } else if (error.type == DioErrorType.sendTimeout) {
      dialogTimeOutService(contextNav.currentContext!);
    }
  }

  Future get({required String url, Map<String, dynamic>? parameter}) async {
    try {
      final response = await _dio.get(
        ApiUrl.proBaseUrl + url,
        queryParameters: parameter,
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future postData(
      {required String urlPath,
      required dynamic body,
      Map<String, dynamic>? parameter}) async {
    try {
      final Response response = await _dio.post(
        ApiUrl.proBaseUrl + urlPath,
        data: body,
        queryParameters: parameter,
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future put(
      {required String urlPath,
      required dynamic body,
      Map<String, dynamic>? parameter}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      final Response response = await _dio.put(
        ApiUrl.proBaseUrl + urlPath,
        data: body,
        queryParameters: parameter,
      );

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 401 &&
          e.response!.data['message'] == 'Unauthorized') {
        pref.remove(SPrefKey.token);
      } else {
        return e.response!.data;
      }
    }
  }

  Future refreshToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString(SPrefKey.token);
    try {
      final Response response = await postData(
          urlPath: ApiUrl.refreshToken, body: {'refresh_token': token});
      if (response.data['code'] == 200) {
        return response.data['data']['refresh_token'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString(SPrefKey.token);
    return token;
  }
}
