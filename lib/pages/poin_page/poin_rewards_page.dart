import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/poin_page/history_poin_page.dart';
import 'package:agent_mobile_app/pages/poin_page/poin_detail_page.dart';
import 'package:agent_mobile_app/pages/poin_page/widgets/card_reward.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoinRewardPage extends StatefulWidget {
  const PoinRewardPage({Key? key}) : super(key: key);

  @override
  State<PoinRewardPage> createState() => _PoinRewardPageState();
}

class _PoinRewardPageState extends State<PoinRewardPage> {
  @override
  void initState() {
    super.initState();
    context.read<RewardsProviders>().getDataRewards();
    context.read<AccountProvider>().getUserData();
  }

  Widget _headersPoin(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: Marginlayout.marginhorizontal,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: CustomShadow.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Image.asset('assets/icons/coin.png',
                    fit: BoxFit.fill, height: 20, width: 20),
                minLeadingWidth: 0,
                dense: true,
                title: Consumer<AccountProvider>(
                    builder: (context, data, _) => Text(
                        data.isLoading == true
                            ? 'Loading...'
                            : '${data.dataAccount.userCoin!.amount} Koin',
                        style: FontStyle.heading1)),
                trailing: IconButton(
                  onPressed: () => RouteWidget.push(
                      context: context, page: const HistoryPoinPage()),
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: ColorApp.secondary00,
                ),
              ),
              Divider(
                color: ColorApp.secondaryB2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '100 poin akan hangus pada 31 Mei 2023',
                style: FontStyle.subtitle2,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          margin: Marginlayout.marginhorizontal.copyWith(top: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.yellow.shade600.withOpacity(0.6),
                ]),
            borderRadius: BorderRadius.circular(6),
            boxShadow: CustomShadow.md,
          ),
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  minVerticalPadding: 0,
                  dense: true,
                  title: Text(
                    'Misi Kejar Koin',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                  subtitle: Text(
                    'Banyak poinnya, Banyak Hadiahnya',
                    style: FontStyle.caption,
                  ),
                ),
              ),
              Image.asset(
                'assets/ilustration/grup_coin.png',
                fit: BoxFit.fill,
                width: 100,
                height: 75,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: '',
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'assets/backround/bg_poin.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          //NOTE:  TUker di Coin kamu
          ListView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            children: [
              _headersPoin(context),
              Padding(
                padding: Marginlayout.marginhorizontal.copyWith(top: 24),
                child: Text(
                  'Tukerin diCoin Kamu',
                  style: FontStyle.subtitle2SemiBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 190,
                  child: Consumer<RewardsProviders>(
                      builder: (context, dataReward, _) {
                    if (dataReward.isLoading == true) {
                      return Center(
                          child: CupertinoActivityIndicator(
                        radius: 12,
                        color: ColorApp.primaryA3,
                      ));
                    } else {
                      if (dataReward.dataRewards.isEmpty) {
                        return Center(
                          child: Text(
                            'Belum ada penawaran',
                            style: FontStyle.subtitle2SemiBold
                                .copyWith(color: ColorApp.secondaryB2),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          padding: Marginlayout.marginhorizontal,
                          scrollDirection: Axis.horizontal,
                          itemCount: dataReward.dataRewards.length,
                          itemBuilder: (context, index) => CardPoinReward(
                            category:
                                dataReward.dataRewards[index].category!.name!,
                            name: dataReward.dataRewards[index].name!,
                            poin: dataReward.dataRewards[index].requiredPoint
                                .toString(),
                            onTap: () => RouteWidget.push(
                                context: context,
                                page: RewardDetailPage(
                                  id: dataReward.dataRewards[index].id
                                      .toString(),
                                )),
                          ),
                        );
                      }
                    }
                  })),
              //NOTE: list data Reward Lainnya
              Padding(
                padding: Marginlayout.marginhorizontal.copyWith(top: 16),
                child: Text(
                  'Reward Lainnya',
                  style: FontStyle.subtitle2SemiBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 190,
                  child: Consumer<RewardsProviders>(
                      builder: (context, dataReward, _) {
                    if (dataReward.isLoading == true) {
                      return Center(
                          child: CupertinoActivityIndicator(
                        radius: 12,
                        color: ColorApp.primaryA3,
                      ));
                    } else {
                      if (dataReward.dataRewards.isEmpty) {
                        return Center(
                          child: Text(
                            'Belum ada penawaran',
                            style: FontStyle.subtitle2SemiBold
                                .copyWith(color: ColorApp.secondaryB2),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          padding: Marginlayout.marginhorizontal,
                          scrollDirection: Axis.horizontal,
                          itemCount: dataReward.dataRewards.length,
                          itemBuilder: (context, index) => CardPoinReward(
                            category:
                                dataReward.dataRewards[index].category!.name!,
                            name: dataReward.dataRewards[index].name!,
                            poin: dataReward.dataRewards[index].requiredPoint
                                .toString(),
                            onTap: () => RouteWidget.push(
                                context: context,
                                page: RewardDetailPage(
                                  id: dataReward.dataRewards[index].id
                                      .toString(),
                                )),
                          ),
                        );
                      }
                    }
                  })),
            ],
          )
        ],
      ),
    );
  }
}
