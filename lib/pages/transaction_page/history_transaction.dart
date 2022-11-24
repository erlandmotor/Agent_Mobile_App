import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/transaction_page/desc_transaction.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';

class HistoryTransaction extends StatelessWidget {
  HistoryTransaction({super.key});

  List<String> productItems = ['Pulsa', 'Paket Data'];
  List<String> statusItems = ['Semua', 'Berhasil', 'Gagal'];
  DateTime datePicker = DateTime.now();
  int totalTransaction = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.primaryA3,
          elevation: 0,
          title: Text(
            'Riwayat Transaksi',
            style: FontStyle.headingPage,
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 70,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 7)
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom.dropDownMenu(
                    listItems: productItems, hint: 'Produk'),
                ButtonCustom.dropDownMenu(
                    listItems: statusItems, hint: 'Status'),
                InkWell(
                  child: Container(
                      width: 118,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorApp.primaryA3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Tanggal',
                            style: FontStyle.button,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: ColorApp.secondaryFF,
                          ),
                        ],
                      )),
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: datePicker,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030));
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          totalTransaction != 0
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
                        SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            RouteWidget.push(
                                context: context, page: DescTransaction());
                          },
                          child: Container(
                            height: 74,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorApp.secondaryFF,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorApp.primaryA3,
                                    child: Image.asset(
                                      'assets/icons/phone.png',
                                      height: 16,
                                      width: 16,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pembelian Pulsa Indosat',
                                        style: FontStyle.captionTransaction,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 62,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: ColorApp.subSecondary1B),
                                        child: Text(
                                          'Berhasil',
                                          style: FontStyle.resultTransaction,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '06.40 WIB',
                                          style: FontStyle.timeTransaction,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '-Rp50.000',
                                          style: FontStyle.captionTransaction,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/ilustration/nothing.png',
                        width: 315.74,
                        height: 250,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Maaf anda belum memiliki transaksi pada saat ini',
                        style: FontStyle.subtitle1,
                      )
                    ],
                  ),
                )
        ]));
  }
}
