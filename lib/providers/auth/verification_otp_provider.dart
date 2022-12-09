import 'dart:async';

import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/models/otp_model.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/foundation.dart';

class VePinsProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();
  final ValueNotifier<int> _timeResend = ValueNotifier<int>(0);
  ValueNotifier<int> get timeResend => _timeResend;

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<bool> _isLoadResendPin = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoadResendPin => _isLoadResendPin;

  Future verificationData({required String email, required String otp}) async {
    print(
      verificationEmailToJson(
        VerificationEmailModel(email: email, otp: otp),
        // VerificationEmailModel(email: email, otp: otp),
      ),
    );
    try {
      _isLoading.value = true;
      // final response = await _api.postData(
      //   urlPath: ApiUrl.verificationCode,
      //   body: verificationEmailToJson(
      //     VerificationEmailModel(email: email, otp: '121212'),
      //     // VerificationEmailModel(email: email, otp: otp),
      //   ),
      // );
      // print(response);

      // print(response);
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

      _isLoading.value = false;
    } catch (e) {
      print(e);
      _timeResend.value = 0;
      print('error');
      _isLoading.value = false;
      //   //NOTE: TODO SOmthing
      // }
    }
    notifyListeners();
  }

  /// post data untuk meminta pind verification email baru
  Future resendPinVerif({required String email}) async {
    try {
      _isLoadResendPin.value = true;
      // final response = await _api.postData(
      //     urlPath: ApiUrl.resendPin,
      //     body: resendOtpModelToJson(ResendOtpModel(email: email)));

      // if (response['code'] == 200 && response['message'] == 'OK') {
      //   counterTime();
      // }
      _isLoadResendPin.value = false;
    } catch (e) {
      _isLoadResendPin.value = false;
      print(e);
      _timeResend.value = 0;
      // NOTE: todo somthing
    }
    notifyListeners();
  }

  /// decrement timer 1 minuts to loading acces new pins
  void counterTime() {
    _timeResend.value = 60;

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
