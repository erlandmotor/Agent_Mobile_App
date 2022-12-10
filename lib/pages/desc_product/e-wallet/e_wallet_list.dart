import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/desc_product/checkout_product.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

import '../../../helper/themes_colors.dart';

class EWalletList extends StatelessWidget {
  EWalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
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
              Expanded(
                child: GridView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return listProductEWallet(
                        context: context,
                        price: '10.000',
                        totalPrice: "11.000");
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.55,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                ),
              )
            ]));
  }

  Widget listProductEWallet({
    required BuildContext context,
    required String price,
    required String totalPrice,
  }) {
    return InkWell(
      child: Container(
          padding: Marginlayout.marginAll,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorApp.secondaryFF,
              boxShadow: CustomShadow.md),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                price,
                style: FontStyle.subtitle2SemiBold,
              ),
            ),
            subtitle: Text(
              "Rp.$totalPrice",
              style: FontStyle.caption,
            ),
          )),
      onTap: () {
        RouteWidget.push(context: context, page: CheckoutPage());
      },
    );
  }
}
