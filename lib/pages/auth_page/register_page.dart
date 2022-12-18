import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_headers.dart';
import 'package:agent_mobile_app/providers/auth/signup_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:agent_mobile_app/widget_reusable/widget_text_error.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> _hidePasswod = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _hideConfirmPasswod = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _equalPassword = ValueNotifier<bool>(true);

  final TextEditingController _usernameInput = TextEditingController();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _inputCodeRefferal = TextEditingController();

  final GlobalKey<FormState> formKeySignUp =
      GlobalKey<FormState>(debugLabel: 'sign-up');

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKeySignUp,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text.rich(
              TextSpan(
                  text: 'Sudah mempunyai Akun?',
                  children: [
                    TextSpan(
                      text: ' Masuk Disini',
                      style: FontStyle.body2.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorApp.primaryA3),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pop(context),
                    ),
                  ],
                  style: FontStyle.body2),
              textAlign: TextAlign.center,
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: Marginlayout.marginhorizontal,
              children: [
                const HeadersTitle(
                  title: 'Selamat Datang di DIGO',
                  subTitle: 'Silahkan daftarkan akun Anda dibawah ini',
                ),
                const SizedBox(
                  height: 25,
                ),
                WidgetFormInput(
                  controller: _usernameInput,
                  obscureText: false,
                  hintText: 'Masukan username',
                  iconSuffix: null,
                  iconPrefix: 'assets/icons/user.png',
                ),
                WidgetFormInputEmail(
                  controller: _emailInput,
                  obscureText: false,
                  hintText: 'Masukan email',
                  iconSuffix: null,
                  iconPrefix: 'assets/icons/mail.png',
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _hidePasswod,
                  builder: (context, view, _) => WidgetFormInput(
                    onTapSuffix: () {
                      _hidePasswod.value = !_hidePasswod.value;
                    },
                    controller: _passwordInput,
                    obscureText: view,
                    colorSuffix: view == true
                        ? ColorApp.secondaryB2
                        : ColorApp.primaryA3,
                    hintText: '**********',
                    iconPrefix: 'assets/icons/lock.png',
                    iconSuffix: 'assets/icons/eye.png',
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _hideConfirmPasswod,
                  builder: (context, view, _) => WidgetFormInput(
                    onTapSuffix: () {
                      _hideConfirmPasswod.value = !_hideConfirmPasswod.value;
                    },
                    controller: _confirmPassword,
                    obscureText: view,
                    colorSuffix: view == true
                        ? ColorApp.secondaryB2
                        : ColorApp.primaryA3,
                    hintText: 'Konfirmasi kata sandi',
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
                ValueListenableBuilder<bool>(
                    valueListenable:
                        context.read<SignUpProviders>().emailAlredy,
                    builder: (context, alredy, _) {
                      if (alredy == false) {
                        return const SizedBox();
                      } else {
                        return const TextError(
                            message: ' Mohon maaf email sudah terdaftar*');
                      }
                    }),
                TextField(
                  controller: _inputCodeRefferal,
                  cursorColor: ColorApp.primaryA3,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10),
                    isCollapsed: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorApp.primaryA3)),
                    hintText: 'Kode Refferal',
                    fillColor: ColorApp.primaryA3,
                    focusColor: ColorApp.primaryA3,
                    hoverColor: ColorApp.primaryA3,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: ColorApp.secondaryEA)),
                    hintStyle:
                        FontStyle.body2.copyWith(color: ColorApp.secondaryB2),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '*Jika tidak ada Kode Refferal tidak perlu diisi (opsional)',
                  style:
                      FontStyle.caption.copyWith(color: ColorApp.secondaryB2),
                ),
                const SizedBox(
                  height: 25,
                ),
                ValueListenableBuilder(
                    valueListenable: context.read<SignUpProviders>().isLoading,
                    builder: (context, loading, _) {
                      if (loading == true) {
                        return ButtonCustom.buttonLoading();
                      } else {
                        return ButtonCustom.buttonPrimary(
                          onTap: () async {
                            if (formKeySignUp.currentState!.validate()) {
                              if (_confirmPassword.text.isNotEmpty &&
                                  _passwordInput.text.isNotEmpty &&
                                  _confirmPassword.text ==
                                      _passwordInput.text) {
                                await context
                                    .read<SignUpProviders>()
                                    .createAccount(
                                      name: _usernameInput.text,
                                      email: _emailInput.text,
                                      password: _passwordInput.text,
                                    );

                                _emailInput.clear();
                                _equalPassword.value = true;
                              } else {
                                context
                                    .read<SignUpProviders>()
                                    .emailAlredy
                                    .value = false;

                                _confirmPassword.clear();
                                _equalPassword.value = false;
                              }
                            }
                          },
                          colorBtn: ColorApp.primaryA3,
                          text: 'Daftar',
                        );
                      }
                    }),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Dengan mendaftar, saya telah menyetujui',
                  style: FontStyle.body2,
                  textAlign: TextAlign.center,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Ketentuan Layanan',
                      children: [
                        TextSpan(text: ' dan ', style: FontStyle.body2),
                        TextSpan(
                          text: 'Kebijakan Kami',
                          style: FontStyle.body2.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorApp.primaryA3),
                        ),
                      ],
                      style: FontStyle.body2.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorApp.primaryA3)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
