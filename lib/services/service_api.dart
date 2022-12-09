import 'dart:async';
import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/form_key.dart';
import 'package:agent_mobile_app/helper/spref.dart';
import 'package:agent_mobile_app/widget_reusable/error_request_api/dialog_bad_request.dart';
import 'package:agent_mobile_app/widget_reusable/error_request_api/dialog_timeout_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApi {
  final Dio dio = Dio();

  Future get({required String url}) async {
    try {
      final response = await dio
          .get(
            ApiUrl.proBaseUrl + url,
          )
          .timeout(const Duration(minutes: 1));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {};
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print('Terjadi kesalahan, Coba Lagi Nanti');
      } else if (e.response!.statusCode == 500) {
        print('Gagal Memuat Data');
      }
      return e;
    } on TimeoutException {
      // dialogTimeOutService(context);
      print('Jaringan Terputus, Periksa Koneksi Kamu Ya');
    }
  }

  Future postData({required String urlPath, required dynamic body}) async {
    try {
      final Response response =
          await Dio().post(ApiUrl.proBaseUrl + urlPath, data: body);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 500) {
        widgetBadRequest(FormKey().mNavigation.currentContext!);
      } else {
        return e.response!.data;
      }
    } on TimeoutException {
      dialogTimeOutService(FormKey().mNavigation.currentContext!);
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
