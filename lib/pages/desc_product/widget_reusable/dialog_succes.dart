import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/desc_product/desc_transaction_page.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_rewards_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final String poin;

  const ShowDialog({super.key, required this.poin});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorApp.secondaryFF,
        ),
        padding: Marginlayout.marginhorizontal,
        child: Padding(
          padding: Marginlayout.marginAll,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/icons/success.png',
                height: 72,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Hore!',
                style: FontStyle.headline6SemiBold,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Kamu mendapatkan',
                style: FontStyle.subtitle2,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/coin.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '$poin Koin',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonCustom.buttonPrimary(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PoinRewardPage()));
                  },
                  colorBtn: ColorApp.primaryA3,
                  text: 'Cek Detail Koin'),
              const SizedBox(
                height: 8,
              ),
              ButtonCustom.buttonSeccondary(
                  onTap: () {
                    Navigator.pop(context);
                    // RouteWidget.push(
                    //     context: context,
                    //     page: const DescTransactionProductPage());
                  },
                  text: 'Detail Transaksi')
            ],
          ),
        ),
      ),
    );
  }
}
