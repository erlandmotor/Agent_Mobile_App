import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_rewards_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class CheckDetailRedeemPage extends StatelessWidget {
  const CheckDetailRedeemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/backround/bg_redeem.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/ilustration/success.png',
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Hore! Koin berhasil ditukar!',
                  textAlign: TextAlign.center,
                  style: FontStyle.heading1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Hadiah yang kamu pilih sedang diproses. Cek detail penukaran untuk informasi lebih lanjut',
                  textAlign: TextAlign.center,
                  style: FontStyle.body1.copyWith(color: ColorApp.secondaryB2),
                ),
                const SizedBox(
                  height: 80,
                ),
                ButtonCustom.buttonPrimary(
                  onTap: () => RouteWidget.push(
                      context: context,
                      page: const DetailTransactionPage(
                        image: 'assets/ilustration/success.png',
                      )),
                  colorBtn: ColorApp.primaryA3,
                  text: 'Cek Detail Penukaran',
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonCustom.buttonSeccondary(
                    onTap: () => RouteWidget.pushAndRemoveUntil(
                        context: context, page: const PoinRewardPage()),
                    text: 'Kembali ke halaman koin')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
