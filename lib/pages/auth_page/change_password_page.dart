import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/widget_reusable/succes_confirm_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _newPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _confmPasswordKey = GlobalKey<FormState>();

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
            AnimatedBuilder(
              animation: _hideConfirmPasswod,
              builder: (context, _) => WidgetFormInput(
                onTapSuffix: () {
                  _hideConfirmPasswod.value = !_hideConfirmPasswod.value;
                },
                controller: _confirmPassword,
                obscureText: _hideConfirmPasswod.value,
                colorSuffix: _hideConfirmPasswod.value == true
                    ? ColorApp.secondaryB2
                    : ColorApp.primaryA3,
                hintText: '**********',
                iconPrefix: 'assets/icons/lock.png',
                iconSuffix: 'assets/icons/eye.png',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonCustom.buttonPrimary(
                onTap: () {
                  //TODO: push cgabge password
                  RouteWidget.push(
                      context: context,
                      page: ConfirmSuccesPage(
                        image: 'assets/ilustration/success.png',
                        title: 'Hore.. Berhasil!',
                        description: 'Password SOMI berhasil diperbaharui...',
                        buttonAction: Padding(
                          padding: Marginlayout.marginhorizontal,
                          child: ButtonCustom.buttonPrimary(
                            onTap: () {
                              RouteWidget.pushAndRemoveUntil(
                                  context: context, page: LoginPage());
                            },
                            colorBtn: ColorApp.primaryA3,
                            text: 'Kembali Ke Login',
                          ),
                        ),
                      ));
                },
                colorBtn: ColorApp.primaryA3,
                text: 'Simpan Kata Sandi'),
          ],
        ),
      ),
    );
  }
}
