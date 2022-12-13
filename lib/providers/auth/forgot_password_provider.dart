import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/pages/auth_page/change_password_page.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:agent_mobile_app/widget_reusable/snacbar_error.dart';
import 'package:agent_mobile_app/widget_reusable/succes_confirm_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class ForgotPaswordProvider extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();

  final ValueNotifier<bool> _isloading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isloading => _isloading;

  final ValueNotifier<bool> _invalidEmailSend = ValueNotifier<bool>(false);
  ValueNotifier<bool> get invalidEmailSend => _invalidEmailSend;

  final ValueNotifier<bool> _loadingforgpass = ValueNotifier<bool>(false);
  ValueNotifier<bool> get loadingforgpass => _loadingforgpass;

  Future sendEmail(BuildContext context, {required String email}) async {
    _isloading.value = true;
    try {
      final Map<String, dynamic> message = await _serviceApi
          .postData(urlPath: ApiUrl.forgotPassword, body: {"email": email});

      if (message['code'] == 200) {
        RouteWidget.push(
            context: context,
            page: ChangePasswordPage(
              email: email,
            ));
        _invalidEmailSend.value = false;
      } else if (message['code'] == 401) {
        _invalidEmailSend.value = true;
      }
      _isloading.value = false;
    } catch (e) {
      _invalidEmailSend.value = false;
      _isloading.value = false;
    }
  }

  Future validateForgotPass(BuildContext context,
      {required String token,
      required String email,
      required String password}) async {
    _loadingforgpass.value = true;
    try {
      final Map<String, dynamic> message = await _serviceApi.postData(
        urlPath: ApiUrl.newPassword,
        parameter: {"email": email, "token": token},
        body: {"Password": password},
      );
      if (message['code'] == 200) {
        RouteWidget.push(
            context: context,
            page: ConfirmSuccesPage(
              image: 'assets/ilustration/success.png',
              title: 'Hore.. Berhasil!',
              description: 'Password SOMI berhasil diperbaharui...',
              buttonAction: Padding(
                padding: Marginlayout.marginhorizontal,
                child: ButtonCustom.buttonPrimary(
                  onTap: () {
                    RouteWidget.pushAndRemoveUntil(
                        context: context, page: LoginPage());
                  },
                  colorBtn: ColorApp.primaryA3,
                  text: 'Kembali Ke Login',
                ),
              ),
            ));
        _invalidEmailSend.value = false;
      } else if (message['code'] == 401) {
        SnackbarCustom()
            .erorrSnacbar(context, message: 'Token yang anda masukan Salah');
        _invalidEmailSend.value = true;
      }
      _loadingforgpass.value = false;
      _isloading.value = false;
    } catch (e) {
      _invalidEmailSend.value = false;
      _loadingforgpass.value = false;
      SnackbarCustom()
          .erorrSnacbar(context, message: 'Terjadi kesalahan coba nanti!');
    }
  }
}
