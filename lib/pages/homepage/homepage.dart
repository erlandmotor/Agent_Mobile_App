import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/backround/bg1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/logo2.png'),
                    Image.asset('assets/icons/notifications.png')
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                topWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container topWidget() {
    return Container(
      height: 143,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorApp.secondaryEA,
      ),
      child: Column(
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
                SizedBox(
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
                    borderRadius: BorderRadius.only(
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
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/medal.png',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
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
              VerticalDivider(
                width: 2,
              ),
              Expanded(
                child: Container(
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10)),
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
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/coin.png',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
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
            ],
          )
        ],
      ),
    );
  }
}
