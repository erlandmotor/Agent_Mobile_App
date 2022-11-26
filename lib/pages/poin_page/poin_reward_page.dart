import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/poin_page/widgets/card_reward.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:flutter/material.dart';

class PoinRewardPage extends StatelessWidget {
  const PoinRewardPage({Key? key}) : super(key: key);

  Widget _headersPoin() {
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
                title: Text('100 Koin', style: FontStyle.heading1),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 21,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
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
              _headersPoin(),
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
                child: ListView.builder(
                  padding: Marginlayout.marginhorizontal,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const CardPoinReward(),
                ),
              ),
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
                child: ListView.builder(
                  padding: Marginlayout.marginhorizontal,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const CardPoinReward(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
