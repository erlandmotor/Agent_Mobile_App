import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final List _buttonBar = ['Semua', 'Promo', 'Informasi'];

  int notifikasi = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _buttonBar.length,
      child: Scaffold(
        backgroundColor: ColorApp.secondaryFF,
        appBar: CustomAppBar.appBarWithTabBarSecond(context,
            backgroundColor: ColorApp.secondaryFF,
            colorComponen: ColorApp.secondary00,
            title: 'Notifikasi',
            tabBar: [
              Text(_buttonBar[0]),
              Text(_buttonBar[1]),
              Text(_buttonBar[2]),
            ]),
        body: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              notifikasi != 0
                  ? Column(
                      children: [
                        Image.asset(
                            'assets/ilustration/nothingNotification.png'),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Belum ada notificasi buatmu',
                          style: FontStyle.headline6,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            'Kalau ada informasia atau promo terbaru buat mu, bisa dicek disini',
                            style: FontStyle.caption,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) => notificationWidget(
                            time: '9 Jam lalu',
                            title:
                                'Ayo buruan lakukan transaksi pembelian pulsa, akan ada diskon 20%',
                            desc:
                                'dengan menggunakan diskon 20%, kamu bisa mendapatkan'),
                      ),
                    )
            ]),
      ),
    );
  }

  Container notificationWidget(
      {required String time, required String title, required String desc}) {
    return Container(
      padding: Marginlayout.marginAll,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Image.asset('assets/icons/promo.png'),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Promo',
                      style: FontStyle.subtitle2,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  time,
                  style: FontStyle.captionBlue,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(
                  title,
                  style: FontStyle.subtitle2SemiBold,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyle.caption,
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: ColorApp.primaryDF,
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
