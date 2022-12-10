import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/desc_product/checkout_product.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

import '../../../helper/themes_colors.dart';

class PaketDataList extends StatelessWidget {
  PaketDataList({super.key});

  String desc =
      '''Kuota Utama 18GB, masa aktif 30 hari. Bonus tambahan kuota zona hingga 18GB, jika registrasi paket zona kuota plus Freedom Internet. Info im3.d0/kuotaplusec. Baru! Nelpon sepuasnya ke sesama IM3 Tri, suara lebih jernih didukung jaringan VoLTE. Pembelian paket akan menggantikan paket yang masih aktif''';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            'Paket Data',
            style: FontStyle.subtitle1SemiBold,
            // textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16,
          ),
          listProductPaketData(
              context: context,
              title:
                  'Freedom Internet 18GB/30 Hari + Bonus Kuota Zona Hingga 18GB',
              desc: desc,
              price: '5850'),
        ]));
  }

  Widget listProductPaketData({
    required BuildContext context,
    required String title,
    required String desc,
    required String price,
  }) {
    return InkWell(
      child: Container(
          padding: Marginlayout.marginAll,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorApp.secondaryFF,
              boxShadow: CustomShadow.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontStyle.subtitle2SemiBold,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                desc,
                textAlign: TextAlign.left,
                style: FontStyle.body2,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Rp.$price',
                style: FontStyle.subtitle1SemiBoldBlue,
              )
            ],
          )),
      onTap: () {
        RouteWidget.push(context: context, page: CheckoutPage());
      },
    );
  }
}
