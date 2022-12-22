import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/poin_page/widgets/card_history_reward.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryPoinPage extends StatefulWidget {
  const HistoryPoinPage({Key? key}) : super(key: key);

  @override
  State<HistoryPoinPage> createState() => _HistoryPoinPageState();
}

class _HistoryPoinPageState extends State<HistoryPoinPage> {
  final List _buttonBar = [
    'Penambahan',
    'Pengurangan',
  ];
  @override
  void initState() {
    super.initState();
    context.read<RewardsProviders>().historyPoinSpent();
  }

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

            Center(
              child: Text(
                'Belum ada koin tambahan',
                style: FontStyle.subtitle2SemiBold
                    .copyWith(color: ColorApp.secondaryB2),
              ),
            ),
            //NOTE: Pengurangan
            Consumer<RewardsProviders>(builder: (context, history, _) {
              if (history.dataHistory.isEmpty) {
                return Center(
                  child: Text(
                    'Belum ada history penukaran',
                    style: FontStyle.subtitle2SemiBold
                        .copyWith(color: ColorApp.secondaryB2),
                  ),
                );
              } else {
                if (history.loadingHistory == true) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      radius: 12,
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: history.dataHistory.length,
                      padding: Marginlayout.marginhorizontal
                          .copyWith(bottom: 16, top: 16),
                      itemBuilder: (context, index) => CardHistoryReward(
                            type: 'spend',
                            name: history.dataHistory[index].reward!.name!,
                            date: context.read<RewardsProviders>().parseDate(
                                history.dataHistory[index].createdAt!,
                                'EEEE ,dd MMM yyyy'),
                            poin: history.dataHistory[index].pointSpent
                                .toString(),
                            time:
                                '${context.read<RewardsProviders>().parseDate(history.dataHistory[index].createdAt!, 'hh:mm')}  ${DateTime.parse(history.dataHistory[index].createdAt!).toLocal().timeZoneName}',
                          ));
                }
              }
            })
          ],
        ),
      ),
    );
  }
}
