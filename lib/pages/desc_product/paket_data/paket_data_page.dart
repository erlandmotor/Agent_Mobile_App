import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/pages/desc_product/check_out_page.dart';
import 'package:agent_mobile_app/pages/desc_product/widget_reusable/widget_reusable.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaketDataPage extends StatefulWidget {
  const PaketDataPage({super.key});

  @override
  State<PaketDataPage> createState() => _PaketDataPageState();
}

class _PaketDataPageState extends State<PaketDataPage> {
  TextEditingController inputNumber = TextEditingController(text: '+62');
  String desc =
      '''Kuota Utama 18GB, masa aktif 30 hari. Bonus tambahan kuota zona hingga 18GB, jika registrasi paket zona kuota plus Freedom Internet. Info im3.d0/kuotaplusec. Baru! Nelpon sepuasnya ke sesama IM3 Tri, suara lebih jernih didukung jaringan VoLTE. Pembelian paket akan menggantikan paket yang masih aktif''';
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    context.read<ProductProviders>().getDataProduct(query: 'paket data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Paket Data',
          action: [
            IconButton(
                onPressed: () {
                  RouteWidget.pushReplacment(
                      context: context,
                      page: const CurrentPages(
                        index: 2,
                      ));
                },
                icon: Image.asset('assets/icons/question.png'))
          ]),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              alignment: Alignment.center,
              color: ColorApp.primaryA3,
              child: Image.asset('assets/icons/wifi.png')),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _keyForm,
                  child: ReusableWidget.overViewReward(
                      context: context, controller: inputNumber),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paket Data',
                      style: FontStyle.subtitle1SemiBold,
                      // textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                        child: Consumer<ProductProviders>(
                            builder: (context, dataProduct, _) =>
                                ListView.builder(
                                    itemCount: dataProduct.dataProducts.length,
                                    itemBuilder: (context, index) => InkWell(
                                          child: Container(
                                              padding: Marginlayout.marginAll,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.white,
                                                  boxShadow: CustomShadow.md),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    dataProduct
                                                        .dataProducts[index]
                                                        .name!,
                                                    style: FontStyle
                                                        .subtitle2SemiBold,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    dataProduct
                                                        .dataProducts[index]
                                                        .description!,
                                                    textAlign: TextAlign.left,
                                                    style: FontStyle.body2,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    context
                                                        .read<
                                                            ProductProviders>()
                                                        .formateQurency(
                                                            angka: dataProduct
                                                                .dataProducts[
                                                                    index]
                                                                .price!),
                                                    style: FontStyle
                                                        .subtitle1SemiBoldBlue,
                                                  )
                                                ],
                                              )),
                                          onTap: () {
                                            if (_keyForm.currentState!
                                                    .validate() ==
                                                true) {
                                              RouteWidget.push(
                                                  context: context,
                                                  page: CheckoutPage(
                                                    id: dataProduct
                                                        .dataProducts[index]
                                                        .id!,
                                                    numberPhone: inputNumber.text,
                                                  ));
                                            }
                                          },
                                        ))))
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
