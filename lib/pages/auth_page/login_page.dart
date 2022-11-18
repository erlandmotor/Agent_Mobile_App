import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_headers.dart';
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
      body: Padding(
        padding: Marginlayout.marginhorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeadersTitle(
              title: 'Selamat Datang di DIGO',
              subTitle: 'Silahkan masukkan akun Anda dibawah ini',
            ),
            WidgetFormInput(
              controller: _emailInput,
              formKey: _formKey,
              obscureText: false,
              hintText: 'E-mail',
            ),
            WidgetFormInput(
              controller: _passwordInput,
              formKey: _formPass,
              obscureText: true,
              hintText: 'Kata Sandi',
            )
          ],
        ),
      ),
    );
  }
}
