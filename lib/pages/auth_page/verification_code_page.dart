import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/widget_reusable/succes_confirm_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: Colors.white,
        colorComponen: ColorApp.secondary00,
        title: 'Lupa Kata Sandi',
      ),
      body: ListView(
        padding: Marginlayout.marginhorizontal,
        children: [
          const SizedBox(
            height: 48,
          ),
          Text(
            'Kode OTP telah kami kirimkan ke E-mail ',
            style: FontStyle.body2,
            textAlign: TextAlign.center,
          ),
          Text(
            'anandre*******@gmail.com',
            textAlign: TextAlign.center,
            style: FontStyle.body2.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          // NOTE: Content Column length : 4 pins
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => Padding(
                padding: index == 3
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(right: 16),
                child: Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                      color: ColorApp.secondaryFF,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      border:
                          Border.all(color: ColorApp.secondaryB2, width: 0.5)),
                ),
              ),
              // Padding(
              //   padding: index == 3
              //       ? EdgeInsets.zero
              //       : const EdgeInsets.only(right: 16),
              //   child: Expanded(
              //     child: Container(
              //       height: 50,
              //       width: 70,
              //       decoration: BoxDecoration(
              //           color: ColorApp.secondaryFF,
              //           borderRadius: BorderRadius.circular(
              //             8,
              //           ),
              //           border: Border.all(
              //               color: ColorApp.secondaryB2, width: 0.5)),
              //     ),
              //   ),
              // ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text.rich(
            //TODO: condition widget to verification
            TextSpan(
                text: 'Mohon tunggu ',
                // 'Anda tidak menerima kode? ',
                style: FontStyle.caption,
                children: [
                  TextSpan(
                    text: '60',
                    //  'Kirim Ulang',
                    style: FontStyle.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorApp.primaryA3,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('object'),
                  ),
                  TextSpan(
                    text: ' detik untuk mengirim ulang',
                    style: FontStyle.caption,
                  )
                ]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonCustom.buttonPrimary(
            onTap: () => RouteWidget.push(
              context: context,
              page: ConfirmSuccesPage(
                image: 'assets/ilustration/success.png',
                title: 'Hore.. Berhasil!',
                description:
                    'Verifikasi akun Anda berhasil nih....Selamat ya! SOMI (SObat MItra) kamu sudaha berhasil menjadi SOMI kami',
                buttonAction: ButtonCustom.buttonPrimary(
                  onTap: () {
                    RouteWidget.pushAndRemoveUntil(
                        context: context, page: LoginPage());
                  },
                  colorBtn: ColorApp.primaryA3,
                  text: 'kembali Ke Login',
                ),
              ),
            ),
            colorBtn: ColorApp.primaryA3,
            text: 'Verifikasi',
          )
        ],
      ),
    );
  }
}
