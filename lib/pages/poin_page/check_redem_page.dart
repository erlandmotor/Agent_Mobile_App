import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_rewards_page.dart';
import 'package:agent_mobile_app/providers/downloaod_provider.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckDetailRedeemPage extends StatefulWidget {
  final int id;
  const CheckDetailRedeemPage({Key? key, required this.id}) : super(key: key);

  @override
  State<CheckDetailRedeemPage> createState() => _CheckDetailRedeemPageState();
}

class _CheckDetailRedeemPageState extends State<CheckDetailRedeemPage> {
  @override
  void initState() {
    super.initState();
    context.read<RewardsProviders>().detailReward(id: widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/ilustration/success.png',
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<RewardsProviders>(
                  builder: (context, data, _) {
                    if (data.dataDetail.name!
                        .toLowerCase()
                        .contains('Modal Usaha'.toLowerCase())) {
                      return _descriptionModal(
                        context,
                        price: context.read<ProductProviders>().formateQurency(
                            angka: data.dataDetail.requiredPoint!),
                        desc: 'Pembelian ${data.dataDetail.name}',
                        methodPayment: Row(
                          children: [
                            Image.asset(
                              'assets/icons/coin.png',
                              height: 19,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Koin',
                              style: FontStyle.subtitle2SemiBold,
                            ),
                          ],
                        ),
                        status: 'SUCCEEDED',
                        time:
                            '${context.read<RewardsProviders>().parseDate(data.dataDetail.createdAt!, 'hh:mm')}  ${DateTime.parse(data.dataDetail.createdAt!).toLocal().timeZoneName} ',
                        date: context.read<RewardsProviders>().parseDate(
                            data.dataDetail.createdAt!, 'dd MMMM yyyy'),
                        total: context.read<ProductProviders>().formateQurency(
                            angka: data.dataDetail.requiredPoint!),
                      );
                    } else {
                      return _cekRedeem(context, data: data);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Column _cekRedeem(BuildContext context, {required RewardsProviders data}) {
  return Column(
    children: [
      Text(
        'Hore! Koin berhasil ditukar!',
        textAlign: TextAlign.center,
        style: FontStyle.heading1,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        'Hadiah yang kamu pilih sedang diproses. Cek detail penukaran untuk informasi lebih lanjut',
        textAlign: TextAlign.center,
        style: FontStyle.body1.copyWith(color: ColorApp.secondaryB2),
      ),
      const SizedBox(
        height: 80,
      ),
      ButtonCustom.buttonPrimary(
        onTap: () => RouteWidget.push(
            context: context,
            page: DetailTransactionPage(
              image: 'assets/ilustration/success.png',
              price: context
                  .read<ProductProviders>()
                  .formateQurency(angka: data.dataDetail.requiredPoint!),
              desc: 'Pembelian ${data.dataDetail.name}',
              methodPayment: Row(
                children: [
                  Image.asset(
                    'assets/icons/coin.png',
                    height: 19,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Koin',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ],
              ),
              status: 'SUCCEEDED',
              date: context
                  .read<RewardsProviders>()
                  .parseDate(data.dataDetail.createdAt!, 'dd MMMM yyyy'),
              time:
                  '${context.read<RewardsProviders>().parseDate(data.dataDetail.createdAt!, 'hh:mm')}  ${DateTime.parse(data.dataDetail.createdAt!).toLocal().timeZoneName} ',
              total: context
                  .read<ProductProviders>()
                  .formateQurency(angka: data.dataDetail.requiredPoint!),
            )),
        colorBtn: ColorApp.primaryA3,
        text: 'Cek Detail Penukaran',
      ),
      const SizedBox(
        height: 16,
      ),
      ButtonCustom.buttonSeccondary(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'Kembali ke halaman koin')
    ],
  );
}

Widget _descriptionModal(
  BuildContext context, {
  required String price,
  required String desc,
  required Widget methodPayment,
  required String status,
  required String time,
  required String date,
  required String total,
}) {
  return SingleChildScrollView(
    child: Column(
      children: [
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
          style: FontStyle.heading1.copyWith(fontWeight: FontWeight.w400),
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
        ButtonCustom.buttonPrimary(
          onTap: () {
            context.read<DownloadProvider>().download(
                url:
                    'https://i.pinimg.com/originals/28/86/6a/28866a4d865e8b222b4a682eb7f3b100.jpg',
                nameFolder: 'bukti_transaksi.png');
          },
          colorBtn: ColorApp.primaryA3,
          text: 'Unduh Bukti Pembayaran',
        ),
        const SizedBox(
          height: 16,
        ),
        ButtonCustom.buttonSeccondaryBor(
            onTap: () {
              RouteWidget.pushAndRemoveUntil(
                  context: context,
                  page: const CurrentPages(
                    index: 0,
                  ));
            },
            text: 'Dashboard')
      ],
    ),
  );
}
