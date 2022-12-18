import 'package:agent_mobile_app/helper/api_url.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/models/users_profile_model.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/services/service_api.dart';
import 'package:agent_mobile_app/widget_reusable/snacbar_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// class ini beisikan fungsi :
/// * mengambil data user
/// * update atau edit data user
/// * logout account
/// * change password
class AccountProvider extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();

  final ValueNotifier<bool> _isUpdate = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isUpdate => _isUpdate;

  final ValueNotifier<bool> _loadUpdatePass = ValueNotifier<bool>(false);
  ValueNotifier<bool> get loadUpdatePass => _loadUpdatePass;

  final ValueNotifier<bool> _invalidOldPass = ValueNotifier<bool>(false);
  ValueNotifier<bool> get invalidOldPass => _invalidOldPass;

  AccountModel _dataAccount = AccountModel.fromJson({});
  AccountModel get dataAccount => _dataAccount;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future getUserData() async {
    _isLoading = true;
    try {
      final Map<String, dynamic> response =
          await _serviceApi.get(url: ApiUrl.accountProfile);
      if (response['code'] == 200 && response['data'] != null) {
        _dataAccount = AccountModel.fromJson(response['data']);
      } else {
        _dataAccount = AccountModel.fromJson({});
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _dataAccount = AccountModel.fromJson({});
    }
    notifyListeners();
  }

  Future editProfile(
      {required String name, required String noHandphone}) async {
    _isUpdate.value = true;
    try {
      final Map<String, dynamic> response =
          await _serviceApi.put(urlPath: ApiUrl.updateProfile, body: {
        "name": name,
        "mobile_number": noHandphone,
      });
      if (response['code'] == 200 && response['data'] != null) {
        SnackbarCustom().succesSnacbar(contextNav.currentContext!,
            message: 'Berhasil melakukan perubahan');
        Navigator.pop(contextNav.currentContext!);
      } else {
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Gagal melakukan perubahan!');
      }

      _isUpdate.value = false;
    } catch (e) {
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Gagal melakukan perubahan!');
      _isUpdate.value = false;
    }
  }

  Future changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    _loadUpdatePass.value = true;
    try {
      final Map<String, dynamic> response =
          await _serviceApi.put(urlPath: ApiUrl.changePassword, body: {
        "old_password": oldPassword,
        "new_password": newPassword,
      });
      if (response['code'] == 200 && response['data'] != null) {
        SnackbarCustom().succesSnacbar(contextNav.currentContext!,
            message: 'Berhasil perbarui kata sandi');
        _invalidOldPass.value = false;
        Navigator.pop(contextNav.currentContext!);
      } else if (response['code'] == 400 && response['data'] == null) {
        _invalidOldPass.value = true;
      } else {
        _invalidOldPass.value = false;
        SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
            message: 'Gagal perbarui kata sandi');
      }

      _loadUpdatePass.value = false;
    } catch (e) {
      SnackbarCustom().erorrSnacbar(contextNav.currentContext!,
          message: 'Gagal perbarui kata sandi');
      _invalidOldPass.value = false;
      _loadUpdatePass.value = false;
    }
  }

  Future logOut(BuildContext context) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    RouteWidget.pushReplacment(context: context, page: LoginPage());
  }
}
