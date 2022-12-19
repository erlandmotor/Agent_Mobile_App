import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class DescTransactionProductPage extends StatefulWidget {
  const DescTransactionProductPage({Key? key}) : super(key: key);

  @override
  State<DescTransactionProductPage> createState() =>
      _DescTransactionProductPageState();
}

class _DescTransactionProductPageState
    extends State<DescTransactionProductPage> {
  @override
  void initState() {
    super.initState();
  }

  bool success = false;

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
                //TODO: push page FAQ
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Image.asset('assets/icons/success.png', height: 72),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '-100 Koin',
                  textAlign: TextAlign.center,
                  style: FontStyle.heading1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Penukaran Pulsa 25.000',
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
                    Image.asset(
                      'assets/icons/bni.png',
                      height: 19,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'BNI',
                      style: FontStyle.subtitle2SemiBold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                // NOTE: Satatus Pembayaran
                detailTransaction(desc: 'Status', value: 'SUKSES'),
                // NOTE: Waktu
                detailTransaction(desc: 'Waktu', value: '14.06 WIB'),
                // NOTE: Tanggal
                const SizedBox(
                  height: 8,
                ),
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
                    '-100 Koin',
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
                    '-100 Koin',
                    style: FontStyle.heading1,
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),
                ButtonCustom.buttonPrimary(
                    onTap: () {},
                    colorBtn: ColorApp.primaryA3,
                    text: 'SELESAI'),
                const SizedBox(
                  height: 16,
                ),
                ButtonCustom.buttonSeccondary(
                    onTap: () {}, text: 'Unduh Bukti Pembayaran')
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile detailTransaction({
    required String desc,
    required String value,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(vertical: -4),
      dense: true,
      title: Text(
        desc,
        style: FontStyle.subtitle2,
      ),
      trailing: Text(
        value,
        style: FontStyle.subtitle2SemiBold,
      ),
    );
  }
}
