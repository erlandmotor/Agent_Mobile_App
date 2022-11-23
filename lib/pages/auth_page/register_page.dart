import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/pages/auth_page/verification_code_page.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_headers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> _hidePasswod = ValueNotifier<bool>(true);
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  final TextEditingController _inputCodeRefferal = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _usernameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPass = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPassConfirm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fontWeight: FontWeight.w600, color: ColorApp.primaryA3),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        {RouteWidget.push(context: context, page: LoginPage())},
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
              controller: _emailInput,
              formKey: _usernameKey,
              obscureText: false,
              hintText: 'Masukan username',
              iconSuffix: null,
              iconPrefix: 'assets/icons/user.png',
            ),
            WidgetFormInput(
              controller: _emailInput,
              formKey: _formKey,
              obscureText: false,
              hintText: 'Masukan email',
              iconSuffix: null,
              iconPrefix: 'assets/icons/mail.png',
            ),
            AnimatedBuilder(
              animation: _hidePasswod,
              builder: (context, _) => WidgetFormInput(
                onTapSuffix: () {
                  _hidePasswod.value = !_hidePasswod.value;
                  print(_hidePasswod.value);
                },
                controller: _passwordInput,
                formKey: _formPass,
                obscureText: _hidePasswod.value,
                colorSuffix: _hidePasswod.value == true
                    ? ColorApp.secondaryB2
                    : ColorApp.primaryA3,
                hintText: '**********',
                iconPrefix: 'assets/icons/lock.png',
                iconSuffix: 'assets/icons/eye.png',
              ),
            ),
            AnimatedBuilder(
              animation: _hidePasswod,
              builder: (context, _) => WidgetFormInput(
                onTapSuffix: () {
                  _hidePasswod.value = !_hidePasswod.value;
                  print(_hidePasswod.value);
                },
                controller: _passwordInput,
                formKey: _formPassConfirm,
                obscureText: _hidePasswod.value,
                colorSuffix: _hidePasswod.value == true
                    ? ColorApp.secondaryB2
                    : ColorApp.primaryA3,
                hintText: 'Konfirmasi kata sandi',
                iconPrefix: 'assets/icons/lock.png',
                iconSuffix: 'assets/icons/eye.png',
              ),
            ),
            TextField(
              controller: _inputCodeRefferal,
              cursorColor: ColorApp.primaryA3,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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
              style: FontStyle.caption.copyWith(color: ColorApp.secondaryB2),
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonCustom.buttonPrimary(
              onTap: () {
                RouteWidget.push(
                    context: context, page: const VerificationCodePage());
              },
              colorBtn: ColorApp.primaryA3,
              text: 'Daftar',
            ),
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
                      fontWeight: FontWeight.w600, color: ColorApp.primaryA3)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
