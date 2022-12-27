import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/spref.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/models/signin_model.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<bool> _invalidLoging = ValueNotifier<bool>(false);
  ValueNotifier<bool> get invalidLoging => _invalidLoging;

  Future signIn({
    required String email,
    required String password,
  }) async {
    _isLoading.value = true;
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final Map<String, dynamic> message = await _api.postData(
        urlPath: ApiUrl.signIn,
        body: modelSignInToJson(
          ModelSignin(
            email: email,
            password: password,
          ),
        ),
      );
      if (message['code'] == 200) {
        _invalidLoging.value = false;
        pref.setString(SPrefKey.token, message['data']['refresh_token']);
        RouteWidget.pushReplacment(
            context: contextNav.currentContext!, page: const CurrentPages());
      } else if (message['code'] == 401) {
        _invalidLoging.value = true;
      } else {
        _invalidLoging.value = true;
      }
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
    }
    notifyListeners();
  }
}
