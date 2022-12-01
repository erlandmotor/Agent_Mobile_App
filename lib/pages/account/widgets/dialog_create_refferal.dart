import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

Future dialogCreateRefferal(
  BuildContext context,
) async {
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
              'Kode Referral'.toUpperCase(),
              style: FontStyle.subtitle1SemiBold,
            ),
            const SizedBox(
              height: 16,
            ),
            //NOTE Data Deskripsi
            Text(
              'Silahkan copy code refferal berikut untuk bagikan ke teman anda',
              style: FontStyle.subtitle2,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              padding:
                  Marginlayout.marginhorizontal.copyWith(top: 10, bottom: 10),
                  alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ColorApp.secondaryB2),
              ),
              child: Text(
                'AHDUY765ASDKJALKD',
                style: FontStyle.subtitle1,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            ButtonCustom.buttonPrimary(
              onTap: () {
                //NOTE : Copy code refferal
              },
              colorBtn: ColorApp.primaryA3,
              text: 'Copy'.toUpperCase(),
            ),
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
