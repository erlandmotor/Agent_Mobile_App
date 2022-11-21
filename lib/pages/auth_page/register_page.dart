import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _usernameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: Marginlayout.marginhorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
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
            Text(
              '*Jika tidak ada Kode Refferal tidak perlu diisi (opsional)',
              style: FontStyle.caption.copyWith(color: ColorApp.secondaryB2),
            ),

            const SizedBox(
              height: 25,
            ),

            ButtonCustom.buttonPrimary(
              onTap: () {},
              colorBtn: ColorApp.primaryA3,
              text: 'Daftar',
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
                  text: 'Sudah mempunyai Akun?',
                  children: [
                    TextSpan(
                      text: ' Masuk Disini',
                      style: FontStyle.body2.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorApp.primaryA3),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              RouteWidget.push(
                                  context: context, page: LoginPage())
                            },
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
