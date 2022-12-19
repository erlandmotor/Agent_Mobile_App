import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/detail_transaction/detail_transaction_page.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/providers/transaction_prov/transaction_provider.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:provider/provider.dart';

class HistoryTransaction extends StatefulWidget {
  const HistoryTransaction({super.key});

  @override
  State<HistoryTransaction> createState() => _HistoryTransactionState();
}

class _HistoryTransactionState extends State<HistoryTransaction> {
  final List<String> productItems = ['Pulsa', 'Paket Data'];

  final List<String> statusItems = ['Semua', 'Berhasil', 'Gagal'];

  final List<String> tabItem = ['Produk', 'Status', 'Tanggal'];

  final DateTime datePicker = DateTime.now();

  final int totalTransaction = 0;

  @override
  void initState() {
    super.initState();
    context.read<TransactionProviders>().getHistoryTransaction();
  }

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
            body: Consumer<TransactionProviders>(builder: (context, data, _) {
              if (data.isloading == true) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 12,
                  ),
                );
              } else {
                if (data.listTransaction.isEmpty) {
                  return _emptyTransaction();
                } else {
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: data.listTransaction.length,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(10),
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
                              visualDensity: const VisualDensity(vertical: 4),
                              onTap: () => RouteWidget.push(
                                context: context,
                                page: DetailTransactionPage(
                                  image: 'assets/icons/wallet.png',
                                  price:
                                      '- ${context.read<ProductProviders>().formateQurency(angka: data.listTransaction[index].amount!)}',
                                  desc:
                                      'Pembelian ${data.listTransaction[index].product!.description!}',
                                  methodPayment: Text(
                                    'Saldo Digo',
                                    style: FontStyle.subtitle2SemiBold,
                                  ),
                                  status: data.listTransaction[index].status! ==
                                          'SUCCEEDED'
                                      ? 'Berhasil'
                                      : data.listTransaction[index].status! ==
                                              'PENDING'
                                          ? 'Pending'
                                          : 'Gagal',
                                  date: context
                                      .read<RewardsProviders>()
                                      .parseDate(
                                          data.listTransaction[index]
                                              .createdAt!,
                                          'dd MMMM yyyy'),
                                  time:
                                      '${context.read<RewardsProviders>().parseDate(data.listTransaction[index].createdAt!, 'hh:mm')}  ${DateTime.parse(data.listTransaction[index].createdAt!).toLocal().timeZoneName} ',
                                  total:
                                      '- ${context.read<ProductProviders>().formateQurency(angka: data.listTransaction[index].amount!)}',
                                ),
                              ),
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
                                    'Pembelian ${data.listTransaction[index].product!.name!}',
                                    maxLines: 1,
                                    style: FontStyle.captionTransaction
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color:
                                          data.listTransaction[index].status! ==
                                                  'SUCCEEDED'
                                              ? ColorApp.subSecondary1B
                                              : data.listTransaction[index]
                                                          .status! ==
                                                      'PENDING'
                                                  ? ColorApp.subSecondary02
                                                  : ColorApp.subSecondary21,
                                    ),
                                    child: Text(
                                      data.listTransaction[index].status! ==
                                              'SUCCEEDED'
                                          ? 'Berhasil'
                                          : data.listTransaction[index]
                                                      .status! ==
                                                  'PENDING'
                                              ? 'Pending'
                                              : 'Gagal',
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
                                    '${context.read<RewardsProviders>().parseDate(data.listTransaction[index].createdAt!, 'hh:mm')} ${DateTime.parse(data.listTransaction[index].createdAt!).toLocal().timeZoneName}',
                                    style: FontStyle.timeTransaction,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '- ${context.read<ProductProviders>().formateQurency(angka: data.listTransaction[index].amount!)}',
                                    style: FontStyle.captionTransaction,
                                  ),
                                ],
                              ),
                            ),
                          ));
                }
              }
            })));
  }

  Widget _emptyTransaction() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ilustration/nothing.png',
            height: MediaQuery.of(context).size.height * 0.25,
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
