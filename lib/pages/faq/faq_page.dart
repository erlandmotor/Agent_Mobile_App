import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/widgets/widget_form_input.dart';
import 'package:agent_mobile_app/providers/faq_prov/faq_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:provider/provider.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController _faqInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<FAQProviders>().dataAllFAQ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryA3,
        automaticallyImplyLeading: false,
        title: Text(
          'Anda Butuh Bantuan ?',
          style: FontStyle.headline5SemiBold.copyWith(color: Colors.white),
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
                  onChange: (String value) =>
                      context.read<FAQProviders>().filterDataFaq(query: value),
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
                const SizedBox(
                  height: 24,
                ),
                Consumer<FAQProviders>(builder: (context, data, _) {
                  if (data.isloading == true) {
                    return SizedBox(
                      height: 100,
                      child: Center(
                          child: CupertinoActivityIndicator(
                        radius: 12,
                        color: ColorApp.primaryA3,
                      )),
                  );
                  } else {
                    if (data.filterFaq.isEmpty) {
                      return SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Belum ada FAQ',
                            style: FontStyle.subtitle2SemiBold
                                .copyWith(color: ColorApp.secondaryB2),
                          ),
                        ),
                      );
                    } else {
                      return Accordion(
                          disableScrolling: true,
                          paddingListTop: 5,
                          paddingListHorizontal: 0,
                          paddingListBottom: 0,
                          headerBorderRadius: 0,
                          maxOpenSections: 1,
                          contentBorderRadius: 0,
                          rightIcon: Icon(
                            Icons.keyboard_arrow_up_outlined,
                            color: ColorApp.secondary00,
                          ),
                          scaleWhenAnimating: true,
                          openAndCloseAnimation: true,
                          headerPadding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          sectionOpeningHapticFeedback:
                              SectionHapticFeedback.heavy,
                          sectionClosingHapticFeedback:
                              SectionHapticFeedback.light,
                          children: List<AccordionSection>.generate(
                            data.filterFaq.length,
                            (index) => AccordionSection(
                              paddingBetweenClosedSections: 0,
                              paddingBetweenOpenSections: 0,
                              headerBackgroundColor: ColorApp.secondaryFF,
                              headerBackgroundColorOpened:
                                  ColorApp.secondaryB2.withOpacity(0.4),
                              header: Text(data.filterFaq[index].question!,
                                  style: FontStyle.subtitle2),
                              content: Text(data.filterFaq[index].answer!,
                                  style: const TextStyle(
                                      color: Color(0xff999999),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                              contentHorizontalPadding: 20,
                              contentBorderWidth: 1,
                              contentBorderColor: ColorApp.secondaryB2,
                            ),
                          ));
                    }
                  }
                }),
                //             Divider(
                //   thickness: 1,
                // )
                Padding(
                  padding: Marginlayout.marginVertical,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: CustomShadow.base,
                        color: ColorApp.secondaryFF),
                    height: 97,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
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
