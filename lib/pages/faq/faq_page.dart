import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/pages/faq/accordion_page.dart';
import 'package:flutter/material.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/helper/shadow.dart';

class FaqPage extends StatelessWidget {
  FaqPage({super.key});

  final TextEditingController _faqInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryA3,
        title: Text(
          'Anda Butuh Bantuan ?',
          style: FontStyle.headline5SemiBold,
        ),
        elevation: 0,
      ),
      backgroundColor: ColorApp.secondaryFF,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/backround/bg_faq.png',
                fit: BoxFit.fill,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Padding(
                padding: Marginlayout.marginhorizontal.copyWith(
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: WidgetFormInputFaq(
                  obscureText: false,
                  hintText: 'Contoh : Bagaimana Transaksi Pulsa',
                  controller: _faqInput,
                  iconPrefix: 'assets/icons/search.png',
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              padding: Marginlayout.marginhorizontal.copyWith(top: 16),
              children: [
                Text(
                  'Yang Sering Ditanyakan !',
                  style: FontStyle.subtitle1SemiBold,
                ),
                SizedBox(
                  height: 24,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AccordionPage();
                  },
                ),
                Padding(
                  padding: Marginlayout.marginVertical,
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        boxShadow: CustomShadow.base,
                        color: ColorApp.secondaryFF),
                    height: 97,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        // contentPadding: EdgeInsetsGeometry.infinity,
                        leading: Container(
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorApp.primaryA3),
                          height: 32,
                          width: 32,
                          child: Image.asset('assets/icons/phonecall.png'),
                        ),
                        title: Text(
                          'Kendala pada Aplikasi?',
                          style: FontStyle.subtitle2SemiBoldBlue,
                        ),
                        subtitle: Text(
                          'Chat CS Kami segera',
                          style: FontStyle.subtitle2Blue,
                        ),
                        trailing: Container(
                          height: 39,
                          width: 117,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: ColorApp.primaryA3),
                          child: Center(
                            child: Text(
                              'KIRIM PESAN',
                              style: FontStyle.button,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
