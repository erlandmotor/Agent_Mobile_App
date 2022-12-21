import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/models/signup_model.dart';
import 'package:agent_mobile_app/pages/auth_page/verification_otp_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/cupertino.dart';

class SignUpProviders extends ChangeNotifier {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<bool> _emailAlredy = ValueNotifier<bool>(false);
  ValueNotifier<bool> get emailAlredy => _emailAlredy;

  final ServiceApi _api = ServiceApi();

  Future createAccount(
      {required String name,
      required String email,
      required String password}) async {
    _isLoading.value = true;
    try {
      final Map<String, dynamic> response = await _api.postData(
          urlPath: ApiUrl.signUp,
          body: modelSignUpToJson(
            ModelSignUp(
                name: name,
                email: email,
                password: password,
                mobileNumber: "+628123456789"),
          ));
      if (response['code'] == 201 && response['errors'] == null) {
        _emailAlredy.value = false;
        RouteWidget.push(
            context: contextNav.currentContext!,
            page: VerificationCodePage(
              email: email,
            ));
      } else if (response['code'] == 409 && response['errors'][0]['value']) {
        _emailAlredy.value = true;
      } else {
        _emailAlredy.value = true;
      }

      _isLoading.value = false;
    } catch (e) {
      _emailAlredy.value = true;
      _isLoading.value = false;
    }
  }
}
