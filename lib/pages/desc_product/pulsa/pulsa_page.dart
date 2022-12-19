import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/desc_product/check_out_page.dart';
import 'package:agent_mobile_app/pages/desc_product/widget_reusable/widget_reusable.dart';
import 'package:agent_mobile_app/providers/product_prov/product_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PulsaPage extends StatefulWidget {
  const PulsaPage({Key? key}) : super(key: key);

  @override
  State<PulsaPage> createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  final TextEditingController _inputNumber = TextEditingController(text: '+62');
  @override
  void initState() {
    super.initState();
    context.read<ProductProviders>().getDataProduct(query: 'pulsa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: Colors.white,
          title: 'Pulsa',
          action: [Image.asset('assets/icons/question.png')]),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            color: ColorApp.primaryA3,
            child: const Icon(
              Icons.phone_android_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableWidget.overViewReward(
                    context: context, controller: _inputNumber),
                _inputNumber.text != ''
                    ? Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nominal',
                            style: FontStyle.subtitle1SemiBold,
                            textAlign: TextAlign.start,
                          ),
                          Expanded(
                            child: Consumer<ProductProviders>(
                                builder: (context, data, _) => ListView.builder(
                                    padding: const EdgeInsets.only(top: 16),
                                    itemCount: data.dataProducts.length,
                                    itemBuilder: (context, index) => Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 16),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: ColorApp.secondaryFF,
                                              boxShadow: CustomShadow.md),
                                          child: ListTile(
                                            onTap: () {
                                              RouteWidget.push(
                                                  context: context,
                                                  page: CheckoutPage(
                                                    id: data.dataProducts[index]
                                                        .id!,
                                                    numberPhone:
                                                        _inputNumber.text,
                                                  ));
                                            },
                                            title: Text(
                                              data.dataProducts[index].name!,
                                              style:
                                                  FontStyle.subtitle2SemiBold,
                                            ),
                                            subtitle: Text(
                                              'Masa aktif ${data.dataProducts[index].activePeriod} hari',
                                              style: FontStyle.caption,
                                            ),
                                            trailing: Text(
                                              context
                                                  .read<ProductProviders>()
                                                  .formateQurency(
                                                      angka: data
                                                          .dataProducts[index]
                                                          .price!),
                                              style: FontStyle
                                                  .subtitle1SemiBoldBlue,
                                            ),
                                          ),
                                        ))),
                          )
                        ],
                      ))
                    : ReusableWidget.inputNumber()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
