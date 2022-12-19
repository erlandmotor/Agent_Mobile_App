import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class DetailTransactionPage extends StatelessWidget {
  final String image, price, desc, status, date, time, total;
  final Widget methodPayment;
  const DetailTransactionPage(
      {Key? key,
      required this.image,
      required this.price,
      required this.desc,
      required this.methodPayment,
      required this.status,
      required this.date,
      required this.time,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: Colors.white,
          colorComponen: ColorApp.secondary00,
          title: '',
          action: [
            IconButton(
              onPressed: () {
                RouteWidget.push(
                    context: context,
                    page: const CurrentPages(
                      index: 2,
                    ));
              },
              icon: Icon(
                Icons.help_outline_sharp,
                color: ColorApp.secondary00,
              ),
            )
          ]),
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
            child: ListView(
              padding: Marginlayout.marginBottom,
              children: [
                Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: FontStyle.heading1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style:
                      FontStyle.heading1.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Rincian Transaksi',
                  style: FontStyle.subtitle1SemiBold,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'Pembayaran',
                      style: FontStyle.subtitle2,
                    ),
                    const Spacer(),
                    methodPayment
                    // Image.asset(
                    //   'assets/icons/coin.png',
                    //   height: 19,
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Koin',
                    //   style: FontStyle.subtitle2SemiBold,
                    // ),
                  ],
                ),

                // NOTE: Satatus Pembayaran
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  visualDensity: const VisualDensity(vertical: -4),
                  dense: true,
                  title: Text(
                    'Status',
                    style: FontStyle.subtitle2,
                  ),
                  trailing: Text(
                    status,
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ),
                // NOTE: Waktu
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  visualDensity: const VisualDensity(vertical: -4),
                  dense: true,
                  title: Text(
                    'Waktu',
                    style: FontStyle.subtitle2,
                  ),
                  trailing: Text(
                    time,
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ),
                // NOTE: Tanggal
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  visualDensity: const VisualDensity(vertical: -4),
                  dense: true,
                  title: Text(
                    'Tanggal',
                    style: FontStyle.subtitle2,
                  ),
                  trailing: Text(
                    date,
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ),
                // NOTE: Tanggal

                Row(
                  children: [
                    Text(
                      'No Invoice',
                      style: FontStyle.subtitle2,
                    ),
                    const Spacer(),
                    Text(
                      '1233423483347****',
                      style: FontStyle.subtitle2SemiBold,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.copy_rounded,
                      size: 19,
                    ),
                  ],
                ),

                // NOTE: Jumlah
                Divider(
                  color: ColorApp.secondary48,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  visualDensity: const VisualDensity(vertical: -4),
                  dense: true,
                  title: Text(
                    'Jumlah',
                    style: FontStyle.subtitle2,
                  ),
                  trailing: Text(
                    total,
                    style: FontStyle.subtitle2SemiBold
                        .copyWith(color: ColorApp.secondaryB2),
                  ),
                ),
                Divider(
                  color: ColorApp.secondary48,
                ),
                //NOTE: TOTAL
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  visualDensity: const VisualDensity(vertical: -4),
                  dense: true,
                  title: Text(
                    'Total',
                    style: FontStyle.heading1,
                  ),
                  trailing: Text(
                    total,
                    style: FontStyle.heading1,
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),
                ButtonCustom.buttonSeccondary(
                    onTap: () {
                      //TODO:  download file function
                    },
                    text: 'Unduh Bukti Pembayaran')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
