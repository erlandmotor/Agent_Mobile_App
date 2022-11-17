import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  final ValueNotifier<int> _indexBoard = ValueNotifier<int>(0);
  final PageController _pageCountroll = PageController(initialPage: 0);

  final List _dataOnBoarding = [
    {
      'image': 'assets/ilustration/on boarding 1.png',
      'title': 'Selamat Datang di DIGO',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
    {
      'image': 'assets/ilustration/on boarding 2.png',
      'title': 'Selalu ada Promo Disetiap Produk',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
    {
      'image': 'assets/ilustration/on boarding 3.png',
      'title': 'Dapatkan Reward-mu Dengan Bertransaksi Bersama Kami',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Marginlayout.marginhorizontal,
        child: AnimatedBuilder(
          animation: _indexBoard,
          builder: (context, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PageView(
                    reverse: true,
                    controller: _pageCountroll,
                    children: [
                      Image.asset(
                        _dataOnBoarding[_indexBoard.value]['image'],
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              // Note : Indicator

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      _dataOnBoarding.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              backgroundColor: index == _indexBoard.value
                                  ? ColorApp.primaryA3
                                  : ColorApp.secondaryB2,
                              radius: 4,
                            ),
                          ))),

              const SizedBox(
                height: 24,
              ),
              AutoSizeText(
                _dataOnBoarding[_indexBoard.value]['title'],
                textAlign: TextAlign.center,
                style: FontStyle.heading1,
              ),
              const SizedBox(
                height: 16,
              ),
              AutoSizeText(
                _dataOnBoarding[_indexBoard.value]['desc'],
                textAlign: TextAlign.center,
                style: FontStyle.body1,
              ),
              const Spacer(),
              ButtonCustom.buttonPrimary(
                onTap: () {
                  if (_indexBoard.value < _dataOnBoarding.length - 1) {
                    _indexBoard.value++;
                    _pageCountroll.jumpToPage(_indexBoard.value);
                  }
                },
                text: 'Berikutnya',
                colorBtn: ColorApp.primaryA3,
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
