import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/models/signup_model.dart';
import 'package:agent_mobile_app/pages/auth_page/verification_otp_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SignUpProviders extends ChangeNotifier {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ServiceApi _api = ServiceApi();

  Future createAccount(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    _isLoading.value = true;
    try {
      final response = await _api.postData(
          urlPath: ApiUrl.signUp,
          body: modelSignUpToJson(
            ModelSignUp(
                name: name,
                email: email,
                password: password,
                mobileNumber: "08123456789"),
          ));

      print(response);
      if (response['code'] == 200 && response['message'].toString() == 'OK') {
        RouteWidget.push(
            context: context,
            page: VerificationCodePage(
              email: email,
            ));
      }

      _isLoading.value = false;
    } catch (e) {
      print('======>>>>>>     ' + e.toString());
      _isLoading.value = false;
    }
  }
}
