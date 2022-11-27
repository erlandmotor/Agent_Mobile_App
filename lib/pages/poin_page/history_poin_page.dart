import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/poin_page/widgets/card_history_reward.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';

class HistoryPoinPage extends StatelessWidget {
  HistoryPoinPage({Key? key}) : super(key: key);
  final List _buttonBar = [
    'Penambahan',
    'Pengurangan',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _buttonBar.length,
      child: Scaffold(
        appBar: CustomAppBar.appBarWithTabBar(
          context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: Colors.white,
          title: 'Riwayat Koin',
          tabBar: [
            Text(
              _buttonBar[0],
            ),
            Text(
              _buttonBar[1],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            //NOTE: Penambahan
            ListView.builder(
                itemCount: 2,
                padding:
                    Marginlayout.marginhorizontal.copyWith(bottom: 16, top: 16),
                itemBuilder: (context, index) => const CardHistoryReward()),
            //NOTE: Pengurangan
            ListView.builder(
                itemCount: 2,
                padding:
                    Marginlayout.marginhorizontal.copyWith(bottom: 16, top: 16),
                itemBuilder: (context, index) => const CardHistoryReward())
          ],
        ),
      ),
    );
  }
}
