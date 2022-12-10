import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/desc_product/desc_transaction_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  TextEditingController codeController = TextEditingController();

  bool methodPayment = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.secondaryFF,
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 32,
            ),
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorApp.secondaryFF,
                  boxShadow: CustomShadow.md),
              child: ButtonCustom.listProductCheckout(
                  textStyle: FontStyle.captionRed,
                  icon: 'assets/icons/money.png',
                  descPayment: 'Saldo Digo',
                  total: '6.000',
                  desc: 'Saldo tidak mencukupi',
                  action: 'Top Up Saldo',
                  text: true,
                  onTap: () {
                    _dialogRedeem(context);
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorApp.secondaryFF,
                  boxShadow: CustomShadow.md),
              child: ButtonCustom.listProductCheckout(
                  textStyle: FontStyle.captionGreen,
                  icon: 'assets/icons/e-wallet.png',
                  descPayment: 'Pembayaran Lain',
                  total: '6.000',
                  desc: 'E-Money, Bank, Gerai ATM',
                  action: 'assets/icons/arrow.png',
                  text: false,
                  onTap: () {
                    _dialogRedeem(context);
                  }),
            ),
            SizedBox(height: 32),
            Text(
              'RIncian Transaksi',
              style: FontStyle.subtitle1SemiBold,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Nama Produk',
                    style: FontStyle.subtitle2,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Pulsa Indosat Rp.5.000',
                        style: FontStyle.subtitle2SemiBold,
                      ),
                      Text(
                        'Masa Aktif 7 Hari',
                        style: FontStyle.subtitle2SemiBold,
                      )
                    ],
                  ),
                )
              ],
            ),
            detailTransaction(desc: 'Nomor Handphone', value: '085712586089'),
            detailTransaction(desc: 'Harga', value: 'Rp.5850'),
            detailTransaction(desc: 'Biaya Admin', value: '-'),
            detailTransaction(desc: 'Promo', value: '-'),
            Divider(
              thickness: 1,
            ),
            detailTransaction(desc: 'Total Pembayaran', value: 'Rp.5850'),
            SizedBox(
              height: 46,
            ),
            methodPayment == true
                ? ButtonCustom.buttonPrimarySecond(
                    onTap: () {},
                    text: 'BAYAR',
                    colorBtn: ColorApp.secondaryEA,
                    methodPayment: false)
                : ButtonCustom.buttonPrimarySecond(
                    onTap: () {
                      RouteWidget.push(
                          context: context, page: DescTransactionProductPage());
                    },
                    text: 'BAYAR',
                    colorBtn: ColorApp.primaryA3,
                    methodPayment: true),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }

  Padding detailTransaction({
    required String desc,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              desc,
              style: FontStyle.subtitle2,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: FontStyle.subtitle2SemiBold,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }

  Future _dialogRedeem(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pilih Metode Pembayaran',
                        style: FontStyle.subtitle2,
                      ),
                      InkWell(
                        child: Image.asset('assets/icons/x.png'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12.5,
                  ),
                  //NOTE Data Deskripsi
                  Text(
                    'E-Money',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  paymentMethod(
                      icon: 'assets/logo/dana1.png', paymentMethod: 'DANA'),
                  paymentMethod(
                      icon: 'assets/logo/shopeepay.png',
                      paymentMethod: 'Shopee Pay'),
                  paymentMethod(
                      icon: 'assets/logo/ovo.png', paymentMethod: 'OVO'),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Virtual Account'),
                  SizedBox(
                    height: 16,
                  ),
                  paymentMethod(
                      icon: 'assets/logo/bni.png', paymentMethod: 'BNI'),
                  paymentMethod(
                      icon: 'assets/logo/bca.png', paymentMethod: 'BCA'),
                  paymentMethod(
                      icon: 'assets/logo/mandiri.png',
                      paymentMethod: 'Mandiri'),
                  paymentMethod(
                      icon: 'assets/logo/bri.png', paymentMethod: 'BRI'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Column paymentMethod({
    required String icon,
    required String paymentMethod,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(icon),
          title: Text(
            paymentMethod,
            style: FontStyle.subtitle2SemiBold,
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        )
      ],
    );
  }
}
