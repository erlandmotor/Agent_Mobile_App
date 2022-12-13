import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/account/account_page.dart';
import 'package:agent_mobile_app/pages/faq/faq_page.dart';
import 'package:agent_mobile_app/pages/home_page/home_page.dart';
import 'package:agent_mobile_app/pages/transaction_page/history_transaction.dart';
import 'package:flutter/material.dart';

class CurrentPages extends StatelessWidget {
  CurrentPages({Key? key}) : super(key: key);
  final ValueNotifier<int> _indexPage = ValueNotifier(0);

  final List<Widget> _itemPages = [
    HomePage(),
    HistoryTransaction(),
    FaqPage(),
    const AccountPage()
  ];

  Widget itemIconNav(
      {required String image,
      required Color bgIcon,
      required Color colorIcon}) {
    return Container(
      height: 30,
      width: 30,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgIcon,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorApp.primaryA3, width: 0.5)),
      child: Image.asset(
        image,
        color: colorIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<int>(
          valueListenable: _indexPage,
          builder: (context, indexPage, _) => _itemPages.elementAt(indexPage),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _indexPage,
          builder: (context, indexPage, _) => BottomNavigationBar(
            currentIndex: indexPage,
            onTap: (moveIndex) {
              _indexPage.value = moveIndex;
            },
            backgroundColor: Colors.white,
            selectedLabelStyle:
                FontStyle.caption.copyWith(fontWeight: FontWeight.w600),
            unselectedLabelStyle: FontStyle.caption,
            selectedItemColor: ColorApp.secondary00,
            unselectedItemColor: ColorApp.secondary00,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: itemIconNav(
                    image: 'assets/icons/Home.png',
                    bgIcon: indexPage == 0 ? ColorApp.primaryA3 : Colors.white,
                    colorIcon:
                        indexPage == 0 ? Colors.white : ColorApp.primaryA3,
                  ),
                  label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: itemIconNav(
                    image: 'assets/icons/transaction.png',
                    bgIcon: indexPage == 1 ? ColorApp.primaryA3 : Colors.white,
                    colorIcon:
                        indexPage == 1 ? Colors.white : ColorApp.primaryA3,
                  ),
                  label: 'Transaksi'),
              BottomNavigationBarItem(
                  icon: itemIconNav(
                    image: 'assets/icons/faq.png',
                    bgIcon: indexPage == 2 ? ColorApp.primaryA3 : Colors.white,
                    colorIcon:
                        indexPage == 2 ? Colors.white : ColorApp.primaryA3,
                  ),
                  label: 'Bantuan'),
              BottomNavigationBarItem(
                  icon: itemIconNav(
                    image: 'assets/icons/profile.png',
                    bgIcon: indexPage == 3 ? ColorApp.primaryA3 : Colors.white,
                    colorIcon:
                        indexPage == 3 ? Colors.white : ColorApp.primaryA3,
                  ),
                  label: 'Profil'),
            ],
          ),
        ));
  }
}
