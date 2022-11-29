import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class CardHistoryReward extends StatelessWidget {
  const CardHistoryReward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Marginlayout.marginBottom,
      // padding: Marginlayout.marginhorizontal.copyWith(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: CustomShadow.md),
      child: ListTile(
        contentPadding:
            Marginlayout.marginhorizontal.copyWith(top: 10, bottom: 10),
        leading: CircleAvatar(
          backgroundColor: ColorApp.primaryA3,
          child: const Icon(Icons.phone_android_rounded),
        ),
        title: Text(
          'Transaksi Paket Data 5GB, 7hr',
          style: FontStyle.caption.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('Transaksi Paket Data 5GB, 7hr',
            style: FontStyle.caption.copyWith(fontSize: 10)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '07:30 WIB',
              style: FontStyle.caption.copyWith(fontSize: 10),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '+50 Koin',
                  style:
                      FontStyle.caption.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/icons/coin.png',
                  height: 18,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                  color: ColorApp.subSecondary1B,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                'Berhasil',
                style: FontStyle.caption
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
