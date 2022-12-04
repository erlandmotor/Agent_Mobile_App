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
      backgroundColor: ColorApp.secondaryFF,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/backround/bg_faq.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SafeArea(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anda Butuh Bantuan ?',
                          style: FontStyle.headline5SemiBold,
                        ),
                        const SizedBox(
                          height: 15.5,
                        ),
                        WidgetFormInputFaq(
                          obscureText: false,
                          hintText: 'Contoh : Bagaimana Transaksi Pulsa',
                          controller: _faqInput,
                          iconPrefix: 'assets/icons/search.png',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Yang Sering Ditanyakan !',
                style: FontStyle.subtitle1SemiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: const [
                        AccordionPage(),
                        Divider(
                          thickness: 1,
                          height: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    boxShadow: CustomShadow.base, color: ColorApp.secondaryFF),
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
    );
  }
}
