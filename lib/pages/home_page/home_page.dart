import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/main.dart';
import 'package:agent_mobile_app/pages/cashout/cashout_page.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_rewards_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Widget> _menuPrabayar = [
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/pulsa.png', title: 'Pulsa'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/paket.png', title: 'Paket Data'),
    ButtonCustom.homePageMenu(
        onTap: () {},
        image: 'assets/icons/voucher.png',
        title: 'Voucher\nGame'),
    ButtonCustom.homePageMenu(
        onTap: () {},
        image: 'assets/icons/listrik.png',
        title: 'Token\nListrik'),
    ButtonCustom.homePageMenu(
        onTap: () {},
        image: 'assets/icons/wallet.png',
        title: 'Top-Up\nE-Wallet'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/pdam.png', title: 'PDAM'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/bpjs.png', title: 'BPJS'),
    ButtonCustom.homePageMenu(
        onTap: () {
          RouteWidget.push(
              context: contextNav.currentContext!,
              page: CashoutPage(icon: 'assets/icons/wallet.png'));
        },
        image: 'assets/icons/other.png',
        title: 'Lainnya'),
  ];

  final List<String> _listBanner = [
    'assets/banner/promo1.png',
    'assets/banner/promo2.png',
    'assets/banner/promo3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leadingWidth: 144,
            elevation: 0,
            leading: Padding(
                padding: Marginlayout.marginLeft,
                child: Image.asset(
                  'assets/logo2.png',
                )),
            actions: [
              Image.asset(
                'assets/icons/notifications.png',
                height: 24,
              ),
            ],
            flexibleSpace: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/backround/bg1.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                headersHome(context)
              ],
            ),
          ),
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.31,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 15),
              itemCount: _menuPrabayar.length,
              itemBuilder: (context, index) => _menuPrabayar[index],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Jualan makin untung',
                style: FontStyle.subtitle2SemiBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                'Dapetin diskon dan harga spesialnya di DIGO sekarang sebelum kehabisan!',
                style: FontStyle.subtitle2,
              ),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: Marginlayout.marginhorizontal.copyWith(bottom: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: _listBanner.length,
                itemBuilder: (context, index) => Image.asset(
                  _listBanner[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ));
  }

  Widget headersHome(BuildContext context) {
    return Container(
      height: 143,
      margin: Marginlayout.marginhorizontal
          .copyWith(top: MediaQuery.of(context).size.height * 0.13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorApp.secondaryEA,
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurRadius: 7, offset: Offset(0.0, 0.75))
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: ColorApp.secondaryFF,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Deposit',
                                style: FontStyle.caption,
                              ),
                              Image.asset(
                                'assets/icons/plus.png',
                                height: 16,
                                width: 16,
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Rp6.000',
                            style: FontStyle.subtitle2SemiBold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                    decoration: BoxDecoration(
                      color: ColorApp.secondaryFF,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: Image.asset(
                              'assets/icons/qr.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Text(
                              'QR Code',
                              style: FontStyle.subtitle2SemiBold,
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                      color: ColorApp.secondaryFF,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Level Digo',
                            style: FontStyle.subtitle2,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/medal.png',
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Newbie',
                                style: FontStyle.subtitle1SemiBold,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 2,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => RouteWidget.push(
                        context: context, page: const PoinRewardPage()),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10)),
                        color: ColorApp.secondaryFF,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Koin Digo',
                              style: FontStyle.subtitle2,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/coin.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '100',
                                  style: FontStyle.subtitle1SemiBold,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
