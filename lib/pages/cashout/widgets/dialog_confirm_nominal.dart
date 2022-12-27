import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/cashout/otp_regitration.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future dialogRedeem(BuildContext context,
    {required int amountBank, required int priceAdmin}) async {
  return showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Konfirmasi Tarik Tunai',
                style: FontStyle.subtitle1SemiBold,
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
            height: 25.5,
          ),
          //NOTE Data Deskripsi
          Text(
            'DETAIL PEMBAYARAN',
            style: FontStyle.subtitle2,
          ),
          const SizedBox(
            height: 16,
          ),
          detailPayment(
              desc: 'Jumlah Tarik Tunai',
              value: context
                  .read<ProductProviders>()
                  .formateQurency(angka: amountBank)),
          detailPayment(
              desc: 'Biaya Admin',
              value: context
                  .read<ProductProviders>()
                  .formateQurency(angka: priceAdmin)),
          const Divider(
            thickness: 1,
          ),
          detailPayment(
              desc: 'Total Pembayaran',
              value: context
                  .read<ProductProviders>()
                  .formateQurency(angka: amountBank + priceAdmin)),
          const SizedBox(height: 8),
          Text(
            'Metode Pembayaran',
            style: FontStyle.subtitle2,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deposit',
                style: FontStyle.subtitle1SemiBoldBlue,
              ),
              Text(
                '-',
                style: FontStyle.subtitle2SemiBold,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorApp.primaryDF.withOpacity(0.2)),
            padding: Marginlayout.marginAll,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/info.png'),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    'Jumlah total pembayaran akan ditahan sampai transaksi berhasil atau kadaluwarsa',
                    style: FontStyle.caption,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 4,
          ),
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                TextSpan(
                    text: 'Dengan Mengkonfimasi, kamu setuju dengan',
                    style: FontStyle.caption),
                TextSpan(
                    text: ' Syarat & Ketentuan ', style: FontStyle.captionBlue),
                TextSpan(text: 'kami', style: FontStyle.caption)
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          ButtonCustom.buttonPrimary(
            onTap: () {
              Navigator.of(context).pop();
              RouteWidget.push(
                  context: context,
                  page: OtpRegistration(
                    amount: amountBank + priceAdmin,
                  ));
            },
            colorBtn: ColorApp.primaryA3,
            text: 'KONFIRMASI',
          ),
        ],
      );
    },
  );
}

Padding detailPayment({
  required String desc,
  required String value,
}) {
  return Padding(
    padding: Marginlayout.marginBottom,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          desc,
          style: FontStyle.subtitle2Silver,
        ),
        Text(
          value,
          style: FontStyle.subtitle2SemiBold,
        )
      ],
    ),
  );
}
