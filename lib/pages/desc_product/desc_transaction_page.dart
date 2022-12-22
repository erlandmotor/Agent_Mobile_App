import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/providers/downloaod_provider.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescTransactionProductPage extends StatefulWidget {
  final int id;
  const DescTransactionProductPage({Key? key, required this.id})
      : super(key: key);

  @override
  State<DescTransactionProductPage> createState() =>
      _DescTransactionProductPageState();
}

class _DescTransactionProductPageState
    extends State<DescTransactionProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProviders>().detailProduct(id: widget.id);
  }

  bool success = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          actions: [
            IconButton(
              onPressed: () {
                RouteWidget.pushReplacment(
                    context: context, page: const CurrentPages(index: 2));
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
          Consumer<ProductProviders>(
            builder: (context, data, _) => Padding(
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
                    '-${context.read<ProductProviders>().formateQurency(angka: data.dataDetail.price!)}',
                    textAlign: TextAlign.center,
                    style: FontStyle.heading1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.dataDetail.name!,
                    textAlign: TextAlign.center,
                    style: FontStyle.heading1
                        .copyWith(fontWeight: FontWeight.w400),
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
                      Text(
                        'E Wallet',
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
                  detailTransaction(
                      desc: 'Waktu',
                      value:
                          '${context.read<RewardsProviders>().parseDate(data.dataDetail.createdAt!, 'hh:mm')}  ${DateTime.parse(data.dataDetail.createdAt!).toLocal().timeZoneName}'),
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
                      onTap: () {
                        RouteWidget.pushAndRemoveUntil(
                            context: context,
                            page: const CurrentPages(
                              index: 0,
                            ));
                      },
                      colorBtn: ColorApp.primaryA3,
                      text: 'SELESAI'),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonCustom.buttonSeccondary(
                      onTap: () {
                        context.read<DownloadProvider>().download(
                            url:
                                'https://i.pinimg.com/originals/28/86/6a/28866a4d865e8b222b4a682eb7f3b100.jpg',
                            nameFolder: 'bukti_transaksi.png');
                      },
                      text: 'Unduh Bukti Pembayaran')
                ],
              ),
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
