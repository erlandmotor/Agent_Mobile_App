import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class PulsaList extends StatelessWidget {
  PulsaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            'Nominal',
            style: FontStyle.subtitle1SemiBold,
            // textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16,
          ),
          ButtonCustom.listProductPulsa(
              descProduct: 'Indosat Ooredo 5.000',
              expired: 'Masa aktif 5 Hari',
              price: '5850'),
        ]));
  }
}
