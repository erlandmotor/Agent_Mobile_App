import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:agent_mobile_app/widget_reusable/widget_text_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordAccountPage extends StatelessWidget {
  ChangePasswordAccountPage({Key? key}) : super(key: key);
  final TextEditingController _textoldPassword = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();
  final TextEditingController _textConfirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _oldPasswod = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _hideNewPasswod = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _hideConfirmPasswod = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _equalnewPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: CustomAppBar.appBarDefault(
          context,
          backgroundColor: Colors.white,
          colorComponen: ColorApp.secondary00,
          title: 'Ganti Kata Sandi',
        ),
        body: Padding(
          padding: Marginlayout.marginhorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Silahkan masukkan password baru Anda',
                textAlign: TextAlign.center,
                style: FontStyle.body1,
              ),
              const SizedBox(
                height: 30,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _oldPasswod,
                builder: (context, hide, _) => WidgetFormInput(
                  onTapSuffix: () {
                    _oldPasswod.value = !_oldPasswod.value;
                  },
                  controller: _textoldPassword,
                  obscureText: hide,
                  colorSuffix:
                      hide == true ? ColorApp.secondaryB2 : ColorApp.primaryA3,
                  hintText: 'Kata Sandi Lama',
                  iconPrefix: 'assets/icons/lock.png',
                  iconSuffix: 'assets/icons/eye.png',
                ),
              ),
              ValueListenableBuilder<bool>(
                  valueListenable:
                      context.read<AccountProvider>().invalidOldPass,
                  builder: (context, equal, _) {
                    if (equal == true) {
                      return const TextError(
                          message: 'Kata sandi lama tidak sesuai*');
                    } else {
                      return const SizedBox();
                    }
                  }),
              ValueListenableBuilder<bool>(
                valueListenable: _hideNewPasswod,
                builder: (context, hide, _) => WidgetFormInput(
                  onTapSuffix: () {
                    _hideNewPasswod.value = !_hideNewPasswod.value;
                  },
                  controller: _textPassword,
                  obscureText: hide,
                  colorSuffix:
                      hide == true ? ColorApp.secondaryB2 : ColorApp.primaryA3,
                  hintText: 'Kata Sandi Baru',
                  iconPrefix: 'assets/icons/lock.png',
                  iconSuffix: 'assets/icons/eye.png',
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _hideConfirmPasswod,
                builder: (context, hide, _) => WidgetFormInput(
                  onTapSuffix: () {
                    _hideConfirmPasswod.value = !_hideConfirmPasswod.value;
                  },
                  controller: _textConfirmPassword,
                  obscureText: hide,
                  colorSuffix:
                      hide == true ? ColorApp.secondaryB2 : ColorApp.primaryA3,
                  hintText: 'Konfirmasi Kata Sandi',
                  iconPrefix: 'assets/icons/lock.png',
                  iconSuffix: 'assets/icons/eye.png',
                ),
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: _equalnewPassword,
                  builder: (context, equal, _) {
                    if (equal == true) {
                      return const SizedBox();
                    } else {
                      return const TextError(
                          message: 'Password yang Anda masukkan tidak sama*');
                    }
                  }),
              const SizedBox(
                height: 25,
              ),
              ValueListenableBuilder<bool>(
                  valueListenable:
                      context.read<AccountProvider>().loadUpdatePass,
                  builder: (context, load, _) {
                    if (load == true) {
                      return ButtonCustom.buttonLoading();
                    } else {
                      return ButtonCustom.buttonPrimary(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (_textPassword.text ==
                                  _textConfirmPassword.text) {
                                context.read<AccountProvider>().changePassword(
                                    context,
                                    oldPassword: _textoldPassword.text.trim(),
                                    newPassword:
                                        _textConfirmPassword.text.trim());
                                _equalnewPassword.value = true;
                              } else {
                                _equalnewPassword.value = false;
                              }
                            }
                          },
                          colorBtn: ColorApp.primaryA3,
                          text: 'Simpan Kata Sandi');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
