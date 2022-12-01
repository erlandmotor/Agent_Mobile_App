import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_reward_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Widget> _menuPrabayar = [
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/pulsa.png', desc: 'Pulsa'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/paket.png', desc: 'Paket Data'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/voucher.png', desc: 'Voucher Game'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/listrik.png', desc: 'Token Listrik'),
    ButtonCustom.homePageMenu(
        onTap: () {},
        image: 'assets/icons/wallet.png',
        desc: 'Top-Up E-Wallet'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/pdam.png', desc: 'PDAM'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/bpjs.png', desc: 'BPJS'),
    ButtonCustom.homePageMenu(
        onTap: () {}, image: 'assets/icons/other.png', desc: 'Lainnya'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: true,
              forceElevated: false,
              backgroundColor: Colors.transparent,
              snap: false,
              centerTitle: true,
              floating: false,
              pinned: true,
              titleSpacing: 1,
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
              leadingWidth: 144,
              leading: Padding(
                  padding: Marginlayout.marginLeft,
                  child: Image.asset(
                    'assets/logo2.png',
                  )),
              expandedHeight: MediaQuery.of(context).size.height * 0.30,
              actions: [
                Image.asset(
                  'assets/icons/notifications.png',
                  height: 24,
                ),
              ],
            )
          ];
        },
        body: Column(
          // padding: Marginlayout.marginhorizontal,
          // physics: const BouncingScrollPhysics(),
          children: [
            // NOTE: Menu Item
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10),
              itemCount: _menuPrabayar.length,
              itemBuilder: (context, index) => _menuPrabayar[index],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Jualan makin untung',
              style: FontStyle.subtitle1SemiBold,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Dapetin diskon dan harga spesialnya di DIGO sekarang sebelum kehabisan!',
              style: FontStyle.subtitle2,
            ),
            const SizedBox(
              height: 16,
            ),
            Image.asset('assets/promo.png')
          ],
        ),
      ),
    );
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
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 55,
                    width: 140,
                    decoration: BoxDecoration(
                        color: ColorApp.secondaryFF,
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
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
                          Text(
                            'Rp6.000',
                            style: FontStyle.subtitle2SemiBold,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/discount.png',
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        'Promo-Ku',
                        style: FontStyle.caption,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/qr.png',
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        'QR Code',
                        style: FontStyle.caption,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    ),
                    color: ColorApp.secondaryFF,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Level Digo',
                          style: FontStyle.subtitle2,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
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
                        )
                      ],
                    ),
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
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10)),
                      color: ColorApp.secondaryFF,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Koin Digo',
                            style: FontStyle.subtitle2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
