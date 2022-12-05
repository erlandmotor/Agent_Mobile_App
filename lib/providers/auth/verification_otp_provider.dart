import 'dart:async';

import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/models/otp_model.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class VePinsProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();
  final ValueNotifier<int> _timeResend = ValueNotifier<int>(0);
  ValueNotifier<int> get timeResend => _timeResend;

  Future verificationData({required String email, required String otp}) async {
    try {
      _timeResend.value = 60;
      // final response = await _api.post(
      //   url: ApiUrl.verificationCode,
      //   body: verificationEmailToJson(
      //     VerificationEmailModel(email: "johndoe@gmail.com", otp: '121212'),
      //   ),
      // );

      // print(response);

      counterTime();
    } catch (e) {
      print(e);
      _timeResend.value = 0;
      print('error');
      //   //NOTE: TODO SOmthing
      // }
    }
    notifyListeners();
  }

  Future resendPinVerif({required String email}) async {
    try {
      _timeResend.value = 60;
      final _response =
          // await _api.post(url: ApiUrl.resendPin, body: {"email": email});

      // RouteWidget.push(
      //   context: context,
      //   page: ConfirmSuccesPage(
      //     image: 'assets/ilustration/success.png',
      //     title: 'Hore.. Berhasil!',
      //     description:
      //         'Verifikasi akun Anda berhasil nih....Selamat ya! SOMI (SObat MItra) kamu sudaha berhasil menjadi SOMI kami',
      //     buttonAction: ButtonCustom.buttonPrimary(
      //       onTap: () {
      //         RouteWidget.pushAndRemoveUntil(
      //             context: context, page: LoginPage());
      //       },
      //       colorBtn: ColorApp.primaryA3,
      //       text: 'kembali Ke Login',
      //     ),
      //   ),
      // ),
      counterTime();
    } catch (e) {
      print(e);
      _timeResend.value = 0;
      // NOTE: todo somthing
    }
    notifyListeners();
  }

  void counterTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeResend.value == 0) {
        timer.cancel();
      } else {
        _timeResend.value -= 1;
      }
    });
    notifyListeners();
  }
}
