import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/change_password_page.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/providers/auth/forgot_password_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:agent_mobile_app/widget_reusable/widget_text_error.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Form(
        key: _emailKey,
        child: ListView(
          padding: Marginlayout.marginhorizontal,
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Masukkan Alamat Email Anda',
                style: FontStyle.body1,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            WidgetFormInputEmail(
              controller: _emailInput,
              obscureText: false,
              hintText: 'Masukan email',
              iconSuffix: null,
              iconPrefix: 'assets/icons/mail.png',
            ),
            // show error texxt email invalid
            ValueListenableBuilder<bool>(
                valueListenable:
                    context.read<ForgotPaswordProvider>().invalidEmailSend,
                builder: (contex, loading, _) {
                  if (loading == true) {
                    return const TextError(
                        message: 'Email yang Anda masukkan tidak sesuai*');
                  } else {
                    return const SizedBox();
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            ValueListenableBuilder<bool>(
                valueListenable:
                    context.read<ForgotPaswordProvider>().isloading,
                builder: (contex, loading, _) {
                  if (loading == true) {
                    return ButtonCustom.buttonLoading();
                  } else {
                    return ButtonCustom.buttonPrimary(
                        onTap: () {
                          if (_emailKey.currentState!.validate() == true) {
                            context
                                .read<ForgotPaswordProvider>()
                                .sendEmail(email: _emailInput.text.trim());
                          }
                        },
                        colorBtn: ColorApp.primaryA3,
                        text: 'Kirim');
                  }
                }),
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
                    ..onTap = () => Navigator.pop(context),
                )
              ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
