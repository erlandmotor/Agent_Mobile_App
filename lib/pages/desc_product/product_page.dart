import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/desc_product/product_pulsa.dart';
import 'package:agent_mobile_app/pages/poin_page/check_redem_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _numbuerKey = GlobalKey<FormState>();
  final TextEditingController _inputNumber = TextEditingController();

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
              child: Image.asset(
                'assets/icons/phone1.png',
              )),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Column(
              children: [
                ListView(
                  children: [
                    _overViewReward(context),
                    SizedBox(
                      height: 20,
                    ),
                    PulsaPage()

                    // Image.asset('assets/backround/input_phone_number.png'),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.50,
                    //   child: Text(
                    //     'Masukkan nomor yang ingin diisi pulsanya',
                    //     style: FontStyle.subtitle1,
                    //     textAlign: TextAlign.center,
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: Marginlayout.marginhorizontal.copyWith(bottom: 40),
          child: ButtonCustom.buttonSecondaryWithIcon(
              onTap: () {
                RouteWidget.push(context: context, page: PulsaPage());
              },
              text: 'Cek harga pulsa dan info lainnya',
              icon: 'assets/icons/arrow.png')),
    );
  }

  Widget _overViewReward(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            bottom: 24, top: MediaQuery.of(context).size.height * 0.2),
        width: double.infinity,
        padding: Marginlayout.marginhorizontal.copyWith(top: 16, bottom: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CustomShadow.md,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Masukkan No. Handphone',
                  style: FontStyle.caption,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: WidgetFormInput(
                      obscureText: false,
                      hintText: 'Contoh : 08571287123',
                      controller: _inputNumber),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        'assets/icons/phone_book.png',
                        height: 24,
                      ),
                    ))
              ],
            ),
          ],
        ));
  }
}
