import 'dart:async';

import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/models/otp_model.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:agent_mobile_app/widget_reusable/succes_confirm_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class VePinsProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();
  final ValueNotifier<int> _timeResend = ValueNotifier<int>(0);
  ValueNotifier<int> get timeResend => _timeResend;

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<bool> _invalidVerification = ValueNotifier<bool>(false);
  ValueNotifier<bool> get invalidVerification => _invalidVerification;

  final ValueNotifier<bool> _isLoadResendPin = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoadResendPin => _isLoadResendPin;

  Future verificationData({required String email, required String otp}) async {
    try {
      _isLoading.value = true;
      final response = await _api.postData(
        urlPath: ApiUrl.verificationCode,
        body: verificationEmailToJson(
          VerificationEmailModel(email: email, otp: otp),
        ),
      );

      if (response['code'] == 200 && response['message'] == 'OK') {
        _invalidVerification.value = false;
        RouteWidget.push(
          context: contextNav.currentContext!,
          page: ConfirmSuccesPage(
            image: 'assets/ilustration/success.png',
            title: 'Hore.. Berhasil!',
            description:
                'Verifikasi akun Anda berhasil nih....Selamat ya! SOMI (SObat MItra) kamu sudah berhasil menjadi SOMI kami',
            buttonAction: ButtonCustom.buttonPrimary(
              onTap: () {
                RouteWidget.pushAndRemoveUntil(
                    context: contextNav.currentContext!, page: LoginPage());
              },
              colorBtn: ColorApp.primaryA3,
              text: 'kembali Ke Login',
            ),
          ),
        );
      } else if (response['code'] == 401 &&
          response['message'] == 'Unauthorized') {
        _invalidVerification.value = true;
      } else {
        _invalidVerification.value = true;
      }

      _isLoading.value = false;
    } catch (e) {
      _invalidVerification.value = true;
      _timeResend.value = 0;
      _isLoading.value = false;
    }
    notifyListeners();
  }

  /// post data untuk meminta pind verification email baru
  Future resendPinVerif({required String email}) async {
    try {
      _invalidVerification.value = false;
      _isLoadResendPin.value = true;
      final Map<String, dynamic> response = await _api.postData(
          urlPath: ApiUrl.resendPin,
          body: resendOtpModelToJson(ResendOtpModel(email: email)));

      if (response['code'] == 201 && response['message'] == 'Created') {
        counterTime();
      }
      _isLoadResendPin.value = false;
    } catch (e) {
      _isLoadResendPin.value = false;
      _timeResend.value = 0;
    }
    notifyListeners();
  }

  String generateName({required String name}) {
    int lengthName = 0;
    List half = [];
    for (var i = 0; i < name.length; i++) {
      if (name[i] != '@') {
        lengthName += 1;
        half.add('*');
      } else {
        break;
      }
    }

    return name.replaceRange((lengthName / 2).ceil(), name.indexOf("@"),
        showHalf(length: (lengthName / 2).ceil()));
  }

  String showHalf({required int length}) {
    String hideStar = '';
    for (var i = 0; i < length; i++) {
      hideStar += '*';
    }
    return hideStar;
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
