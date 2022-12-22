import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/providers/auth/verification_otp_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VerificationCodePage extends StatelessWidget {
  final String email;
  VerificationCodePage({Key? key, required this.email}) : super(key: key);
  final TextEditingController _pin1 = TextEditingController();

  final TextEditingController _pin2 = TextEditingController();

  final TextEditingController _pin3 = TextEditingController();

  final TextEditingController _pin4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: Colors.white,
        colorComponen: ColorApp.secondary00,
        title: 'Verifikasi Kode OTP',
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
            // email,
            context.read<VePinsProvider>().generateName(name: email),
            textAlign: TextAlign.center,
            style: FontStyle.body2.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          // NOTE: Content Column length : 4 pins
          Consumer<VePinsProvider>(builder: (context, data, _) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.secondaryFF,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          border: Border.all(
                              color: ColorApp.secondaryB2, width: 0.5)),
                      child: TextField(
                        controller: _pin1,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        cursorColor: ColorApp.primaryA3,
                        style: FontStyle.headline5
                            .copyWith(color: ColorApp.primaryA3),
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (String newValue) {
                          if (newValue.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                            hintText: '',
                            hintStyle: FontStyle.headline5
                                .copyWith(color: ColorApp.primaryA3),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.secondaryFF,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          border: Border.all(
                              color: ColorApp.secondaryB2, width: 0.5)),
                      child: TextField(
                        controller: _pin2,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        cursorColor: ColorApp.primaryA3,
                        style: FontStyle.headline5
                            .copyWith(color: ColorApp.primaryA3),
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (String newValue) {
                          if (newValue.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                            hintText: '',
                            hintStyle: FontStyle.headline5
                                .copyWith(color: ColorApp.primaryA3),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.secondaryFF,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          border: Border.all(
                              color: ColorApp.secondaryB2, width: 0.5)),
                      child: TextField(
                        controller: _pin3,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        cursorColor: ColorApp.primaryA3,
                        style: FontStyle.headline5
                            .copyWith(color: ColorApp.primaryA3),
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (String newValue) {
                          if (newValue.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                            hintText: '',
                            hintStyle: FontStyle.headline5
                                .copyWith(color: ColorApp.primaryA3),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.secondaryFF,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          border: Border.all(
                              color: ColorApp.secondaryB2, width: 0.5)),
                      child: TextField(
                        controller: _pin4,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        cursorColor: ColorApp.primaryA3,
                        style: FontStyle.headline5
                            .copyWith(color: ColorApp.primaryA3),
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (String newValue) {
                          if (newValue.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                            hintText: '',
                            hintStyle: FontStyle.headline5
                                .copyWith(color: ColorApp.primaryA3),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ]),
            );
          }),

          const SizedBox(
            height: 25,
          ),

          ValueListenableBuilder<bool>(
            valueListenable: context.read<VePinsProvider>().isLoadResendPin,
            builder: (context, loadResend, _) => ValueListenableBuilder<int>(
                valueListenable: context.read<VePinsProvider>().timeResend,
                builder: (context, time, _) {
                  if (loadResend == true) {
                    return CupertinoActivityIndicator(
                      radius: 10,
                      color: ColorApp.primaryA3,
                    );
                  } else {
                    return ValueListenableBuilder(
                      valueListenable:
                          context.read<VePinsProvider>().invalidVerification,
                      builder: (context, invalide, _) => Text.rich(
                        TextSpan(
                            text: invalide == true
                                ? 'Autentikasi Gagal ! Code OTP tidak valid*    '
                                : time == 0
                                    ? 'Anda tidak menerima kode? '
                                    : 'Mohon tunggu ',
                            style: FontStyle.caption.copyWith(
                                color: invalide == true
                                    ? ColorApp.subSecondary21
                                    : ColorApp.secondary00),
                            children: [
                              TextSpan(
                                text:
                                    time == 0 ? 'Kirim Ulang' : time.toString(),
                                style: FontStyle.caption.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: ColorApp.primaryA3,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (time == 0) {
                                      context
                                          .read<VePinsProvider>()
                                          .resendPinVerif(email: email);
                                    }
                                  },
                              ),
                              TextSpan(
                                text: time == 0
                                    ? ''
                                    : ' detik untuk mengirim ulang',
                                style: FontStyle.caption,
                              )
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          ValueListenableBuilder(
              valueListenable: context.read<VePinsProvider>().isLoading,
              builder: (context, loading, _) {
                if (loading == true) {
                  return ButtonCustom.buttonLoading();
                } else {
                  return ButtonCustom.buttonPrimary(
                    onTap: () async {
                      await context.read<VePinsProvider>().verificationData(
                            email: email,
                            otp:
                                '${_pin1.text}${_pin2.text}${_pin3.text}${_pin4.text}',
                          );

                      _pin1.clear();
                      _pin2.clear();
                      _pin3.clear();
                      _pin4.clear();
                    },
                    colorBtn: ColorApp.primaryA3,
                    text: 'Verifikasi',
                  );
                }
              })
        ],
      ),
    );
  }
}
