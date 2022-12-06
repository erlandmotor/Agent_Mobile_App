import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/spref.dart';
import 'package:agent_mobile_app/models/signin_model.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  Future signIn(BuildContext context,
      {required String email, required String password}) async {
    _isLoading.value = true;

    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      final Map<String, dynamic> response = await _api.postData(
        urlPath: ApiUrl.signIn,
        body: modelSignInToJson(
          ModelSignin(
            email: email,
            password: password,
          ),
        ),
      );
      if (response['code'] == 200 && response['message'] == 'OK') {
        pref.setString(SPrefKey.token, response['data']['access_token']);
        pref.setString(SPrefKey.token, response['data']['refresh_token']);
        RouteWidget.push(context: context, page: CurrentPages());
      }
      _isLoading.value = false;
    } catch (e) {
      print(e);
      _isLoading.value = false;
      //TODO: something
    }
  }
}
