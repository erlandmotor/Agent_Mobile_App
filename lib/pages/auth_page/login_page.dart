import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/forgot_password_page.dart';
import 'package:agent_mobile_app/pages/auth_page/register_page.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_headers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> _hidePasswod = ValueNotifier<bool>(true);
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Text.rich(
          TextSpan(
              text: 'Tidak mempunyai akun?',
              children: [
                TextSpan(
                  text: ' Daftar Disini',
                  style: FontStyle.body2.copyWith(
                      fontWeight: FontWeight.w600, color: ColorApp.primaryA3),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                          RouteWidget.push(
                              context: context, page: RegisterPage())
                        },
                ),
              ],
              style: FontStyle.body2),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: Marginlayout.marginhorizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            const HeadersTitle(
              title: 'Selamat Datang di DIGO',
              subTitle: 'Silahkan masukkan akun Anda dibawah ini',
            ),
            const SizedBox(
              height: 48,
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
                  // print(_hidePasswod.value);
                },
                controller: _passwordInput,
                formKey: _formPass,
                obscureText: _hidePasswod.value,
                colorSuffix: _hidePasswod.value == true
                    ? ColorApp.secondaryB2
                    : ColorApp.primaryA3,
                hintText: '*********',
                iconPrefix: 'assets/icons/lock.png',
                iconSuffix: 'assets/icons/eye.png',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    value: false,
                    onChanged: (value) {},
                    activeColor: ColorApp.primaryA3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    side: BorderSide(color: ColorApp.secondaryEA, width: 1.5),
                    title: Text(
                      'Ingat saya',
                      style: FontStyle.body1.copyWith(
                          color: ColorApp.secondary00,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    RouteWidget.push(
                        context: context, page: ForgotPasswordPage());
                  },
                  child: Text(
                    'Lupa kata sandi?',
                    style: FontStyle.body1.copyWith(
                        color: ColorApp.primaryA3, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonCustom.buttonPrimary(
              onTap: () {},
              colorBtn: ColorApp.primaryA3,
              text: 'Masuk',
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Dengan mendaftar, saya telah menyetujui',
              textAlign: TextAlign.center,
              style: FontStyle.body2,
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
            //NOte: move register
          ],
        ),
      ),
    );
  }
}
