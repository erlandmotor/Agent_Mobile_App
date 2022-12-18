import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';

class HistoryTransaction extends StatelessWidget {
  HistoryTransaction({super.key});

  final List<String> productItems = ['Pulsa', 'Paket Data'];
  final List<String> statusItems = ['Semua', 'Berhasil', 'Gagal'];
  final List<String> tabItem = ['Produk', 'Status', 'Tanggal'];
  final DateTime datePicker = DateTime.now();
  final int totalTransaction = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabItem.length,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: ColorApp.primaryA3,
                automaticallyImplyLeading: false,
                elevation: 3,
                title: Text(
                  'Riwayat Transaksi',
                  style: FontStyle.headingPage,
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Material(
                    child: SizedBox(
                      height: 50,
                      child: TabBar(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          tabs: List<Widget>.generate(
                            tabItem.length,
                            (index) => ButtonCustom.dropDownMenu(
                                listItems: productItems, hint: tabItem[index]),
                          )),
                    ),
                  ),
                )),
            body: totalTransaction != 0
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kamis, 17 November 2022',
                            style: FontStyle.dateTransaction,
                            // textAlign: TextAlign.end,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: Marginlayout.marginhorizontal
                                .copyWith(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorApp.secondaryFF,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              minLeadingWidth: 50,
                              visualDensity: const VisualDensity(vertical: 2),
                              onTap: () => RouteWidget.push(
                                  context: context,
                                  page: const DetailTransactionPage(
                                      image: 'assets/icons/wallet.png')),
                              leading: CircleAvatar(
                                backgroundColor: ColorApp.primaryA3,
                                child: Image.asset(
                                  'assets/icons/phone.png',
                                  height: 16,
                                  width: 16,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pembelian Pulsa Indosat',
                                    style: FontStyle.captionTransaction
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: ColorApp.subSecondary1B),
                                    child: Text(
                                      'Berhasil',
                                      style: FontStyle.resultTransaction,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '06.40 WIB',
                                    style: FontStyle.timeTransaction,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '-Rp50.000',
                                    style: FontStyle.captionTransaction,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/icons/bni.png',
                                        height: 18,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'BNI',
                                        style: FontStyle.caption.copyWith(
                                            color: ColorApp.secondaryB2),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : _emptyTransaction()));
  }

  Widget _emptyTransaction() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ilustration/nothing.png',
            width: 315.74,
            height: 250,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Maaf anda belum memiliki transaksi pada saat ini',
            textAlign: TextAlign.center,
            style: FontStyle.subtitle1,
          )
        ],
      ),
    );
  }
}
