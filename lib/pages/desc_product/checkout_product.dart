import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: ListView(
          children: [
            Text(
              'Apakah kamu mempunyai kode promo?',
              style: FontStyle.subtitle2,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 7,
                  child: WidgetFormInputCode(
                    obscureText: false,
                    hintText: 'Masukkan Kode',
                    controller: codeController,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: ButtonCustom.buttonPrimary(
                      onTap: () {},
                      colorBtn: ColorApp.primaryA3,
                      text: 'Gunakan'),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Pilih Metode Pembayaran',
              style: FontStyle.subtitle1SemiBold,
            ),
            SizedBox(
              height: 16,
            ),
            ButtonCustom.listProductCheckout(
                icon: 'assets/icons/money.png',
                descPayment: 'Saldo Digo',
                total: '6.000',
                desc: 'Top Up Saldo',
                onTap: () {
                  _dialogRedeem(context);
                }),

            ButtonCustom.listProductCheckout(
              icon: 'assets/icons/e-wallet.png',
              descPayment: 'Saldo Digo',
              total: '6.000',
              desc: 'Top Up Saldo',
              onTap: () {
                _dialogRedeem(context);
              },
            ),

            // action: 'Saldo tidak mencukupi')
          ],
        ),
      ),
    );
  }

  Future _dialogRedeem(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Redeem Poin',
                style: FontStyle.subtitle1SemiBold,
              ),
              const SizedBox(
                height: 16,
              ),
              //NOTE Data Deskripsi
              Text(
                'Masukan Nomor Handphone Terlebih dahulu sebelum anda melakukan Redeem poin.',
                style: FontStyle.subtitle2,
              ),
              const SizedBox(
                height: 16,
              ),
              // WidgetFormInput(
              //   obscureText: false,
              //   hintText: '08**********',
              //   controller: _inputNumber,
              //   iconPrefix: 'assets/icons/call.png',
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0),
              //   child: Text(
              //     '*Nomor HP yang anda masukkan tidak sesuai',
              //     style: FontStyle.caption
              //         .copyWith(color: ColorApp.subSecondary21),
              //   ),
              // ),
              const SizedBox(
                height: 70,
              ),
              // ButtonCustom.buttonPrimary(
              //   onTap: () => RouteWidget.push(
              //       context: context, page: const CheckDetailRedeemPage()),
              //   // colorBtn: ColorApp.secondaryB2,
              //   // text: 'Oups, dikoin kamu belum cukup',
              //   colorBtn: ColorApp.primaryA3,
              //   text: 'Redeem Sekarang',
              // ),
              const SizedBox(
                height: 16,
              ),
              ButtonCustom.buttonSeccondary(
                onTap: () => Navigator.pop(context),
                text: 'Nanti deh',
              ),
            ],
          ),
        );
      },
    );
  }
}
