import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final TextEditingController _emailInput = TextEditingController();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: Colors.white,
        colorComponen: ColorApp.secondary00,
        title: 'Lupa Kata Sandi',
      ),
      body: Padding(
        padding: Marginlayout.marginhorizontal,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Masukkan Alamat Email Anda',
              style: FontStyle.body1,
            ),
            const SizedBox(
              height: 30,
            ),
            WidgetFormInput(
              controller: _emailInput,
              formKey: _emailKey,
              obscureText: false,
              hintText: 'Masukan email',
              iconSuffix: null,
              iconPrefix: 'assets/icons/mail.png',
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonCustom.buttonPrimary(
                onTap: () {
                  //TODO: push email
                },
                colorBtn: ColorApp.primaryA3,
                text: 'Kirim'),
            const SizedBox(
              height: 40,
            ),
            Text.rich(
              TextSpan(text: 'Kembali ke ', style: FontStyle.body2, children: [
                TextSpan(
                  text: 'Masuk',
                  style: FontStyle.body2.copyWith(
                    color: ColorApp.primaryA3,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        {RouteWidget.push(context: context, page: LoginPage())},
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
