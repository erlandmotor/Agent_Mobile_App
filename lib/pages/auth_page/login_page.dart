import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_headers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: Marginlayout.marginhorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const HeadersTitle(
              title: 'Selamat Datang di DIGO',
              subTitle: 'Silahkan masukkan akun Anda dibawah ini',
            ),
             const SizedBox(
              height: 25,
            ),
            WidgetFormInput(
              controller: _emailInput,
              formKey: _formKey,
              obscureText: false,
              hintText: 'E-mail',
              iconSuffix: null,
              iconPrefix: 'assets/icons/mail.png',
            ),
            WidgetFormInput(
              onTapSuffix: () {},
              controller: _passwordInput,
              formKey: _formPass,
              obscureText: true,
              hintText: 'Kata Sandi',
              iconPrefix: 'assets/icons/lock.png',
              iconSuffix: 'assets/icons/eye.png',
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
                Text(
                  'Lupa kata sandi?',
                  style: FontStyle.body1.copyWith(
                      color: ColorApp.primaryA3, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Divider(),
                Expanded(
                    child: Divider(
                  endIndent: 15,
                  color: ColorApp.secondaryEA,
                )),
                Text(
                  'Atau masuk dengan',
                  style: FontStyle.caption,
                ),
                Expanded(
                    child: Divider(
                  indent: 15,
                  color: ColorApp.secondaryEA,
                ))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonCustom.buttonPrimary(
              onTap: () {},
              colorBtn: ColorApp.primaryA3,
              text: 'Login',
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonCustom.buttonPrimary(
              onTap: () {},
              colorBtn: ColorApp.primaryA3,
              text: 'Login',
            ),
            const Spacer(),
            Text(
              'Dengan mendaftar, saya telah menyetujui',
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
            ),
            const Spacer(),

            //NOte: move register
            Text.rich(
              TextSpan(
                  text: 'Tidak mempunyai akun?',
                  children: [
                    TextSpan(
                        text: ' Daftar Disini',
                        style: FontStyle.body2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorApp.primaryA3),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              print('Tap Here onTap') //TODO: move to register,
                        ),
                  ],
                  style: FontStyle.body2),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
