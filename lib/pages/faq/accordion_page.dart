import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class AccordionPage extends StatelessWidget //__
{
  const AccordionPage({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''DIGO atau Digital Outlet merupakan sebuah aplikasi mitra DIGO dimana ada banyak pengguna outlet/agent yang berada di banyak tempat untuk membantu orang lain terkait pembayaran tagihan secara digital''';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Accordion(
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                paddingBetweenClosedSections: 0,
                paddingBetweenOpenSections: 0,
                headerBackgroundColor: ColorApp.secondaryFF,
                headerBackgroundColorOpened:
                    ColorApp.secondaryB2.withOpacity(0.4),
                header: Text('Apa itu DIGO?', style: FontStyle.subtitle2),
                content: Text(_loremIpsum, style: _contentStyle),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                contentBorderColor: ColorApp.secondaryB2,
              ),
            ]),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
