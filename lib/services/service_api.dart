import 'dart:async';

import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/models/signup_model.dart';
import 'package:dio/dio.dart';

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
    } on TimeoutException catch (e) {
      print('Jaringan Terputus, Periksa Koneksi Kamu Ya');
    }
  }

  Future postData({required String urlPath, required String body}) async {
    try {
      final response = await Dio()
          .post(ApiUrl.proBaseUrl + urlPath, data: body)
          .timeout(const Duration(minutes: 1));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {};
      }
    } on DioError catch (e) {
      print(e.response!.statusCode);
      if (e.response!.statusCode == 400 || e.response!.statusCode == 404) {
        print('Terjadi kesalahan, Coba Lagi Nanti');
      } else if (e.response!.statusCode == 500) {
        print('Gagal Memuat Data');
      }
      return e;
    } on TimeoutException catch (e) {
      print('Jaringan Terputus, Periksa Koneksi Kamu Ya');
    }
  }
}
