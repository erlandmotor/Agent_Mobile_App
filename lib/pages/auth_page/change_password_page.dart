import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/providers/auth/forgot_password_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:agent_mobile_app/widget_reusable/widget_text_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatelessWidget {
  final String email;
  ChangePasswordPage({Key? key, required this.email}) : super(key: key);
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _token = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _equalPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _hideNewPasswod = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _hideConfirmPasswod = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: Colors.white,
        colorComponen: ColorApp.secondary00,
        title: 'Ganti Kata Sandi',
      ),
      body: Form(
        key: _formKey,
        child: Padding(
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
              AnimatedBuilder(
                animation: _hideNewPasswod,
                builder: (context, _) => WidgetFormInput(
                  onTapSuffix: () {
                    _hideNewPasswod.value = !_hideNewPasswod.value;
                  },
                  controller: _newPassword,
                  obscureText: _hideNewPasswod.value,
                  colorSuffix: _hideNewPasswod.value == true
                      ? ColorApp.secondaryB2
                      : ColorApp.primaryA3,
                  hintText: '**********',
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
                  controller: _confirmPassword,
                  obscureText: hide,
                  colorSuffix:
                      hide == true ? ColorApp.secondaryB2 : ColorApp.primaryA3,
                  hintText: '**********',
                  iconPrefix: 'assets/icons/lock.png',
                  iconSuffix: 'assets/icons/eye.png',
                ),
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: _equalPassword,
                  builder: (context, equal, _) {
                    if (equal == true) {
                      return const SizedBox();
                    } else {
                      return const TextError(
                          message: 'Password yang Anda masukkan tidak sama*');
                    }
                  }),
              WidgetFormOnlyInput(
                controller: _token,
                hintText: 'Token ',
                messageError: 'Token wajib diisi untuk memvalidasi akun Anda*',
              ),
              Text('*Cek E-mail Anda untuk melihat token',
                  textAlign: TextAlign.left,
                  style: FontStyle.caption.copyWith(color: ColorApp.primaryA3)),
              const SizedBox(
                height: 25,
              ),
              ValueListenableBuilder<bool>(
                  valueListenable:
                      context.read<ForgotPaswordProvider>().loadingforgpass,
                  builder: (context, load, _) {
                    if (load == true) {
                      return ButtonCustom.buttonLoading();
                    } else {
                      return ButtonCustom.buttonPrimary(
                          onTap: () {
                            if (_formKey.currentState!.validate() == true) {
                              if (_newPassword.text.trim() ==
                                  _confirmPassword.text.trim()) {
                                _equalPassword.value = true;
                                context
                                    .read<ForgotPaswordProvider>()
                                    .validateForgotPass(
                                      context,
                                      email: email,
                                      password: _confirmPassword.text,
                                      token: _token.text,
                                    );
                              } else {
                                _equalPassword.value = false;
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
