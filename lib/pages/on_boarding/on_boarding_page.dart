import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/pages/auth_page/login_page.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  final ValueNotifier<int> _indexBoard = ValueNotifier<int>(0);
  final ValueNotifier<int> _indexMove = ValueNotifier<int>(1);
  final PageController _pageCountroll = PageController(initialPage: 0);

  final List _dataOnBoarding = [
    {
      'image': 'assets/ilustration/on boarding 1.png',
      'title': 'Selamat Datang di DIGO',
      'desc':
          'Selamat Datang di DIGO (DIGital Outlet) Aplikasi agen yang menyediakan berbagai produk pengisiian pulsa, paket data, pembayaran PDAM, dll. Kumpulikan sebanyak-banyaknya CUAN-mu'
    },
    {
      'image': 'assets/ilustration/on boarding 2.png',
      'title': 'Selalu ada Promo Disetiap Produk',
      'desc':
          'Dengan aplikasi DIGO akan selalu ada promo menarik di tiap bulannya yang akan dibagikan kepada kalian pengguna setia DIGO'
    },
    {
      'image': 'assets/ilustration/on boarding 3.png',
      'title': 'Dapatkan Reward-mu Dengan Bertransaksi Bersama Kami',
      'desc':
          'Hanya dengan bertansaksi melalui aplikasi DIGO anda bisa mendapatkan reward berupa poin yang bisa anda tukarkan pada reedem coin menjadi uang, pulsa , data dan berbagai macam reward luar biasa lainnya'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  child: PageView.builder(
                    reverse: true,
                    itemCount: _dataOnBoarding.length,
                    controller: _pageCountroll,
                    itemBuilder: (context, index) => Image.asset(
                      _dataOnBoarding[_indexBoard.value]['image'],
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
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
              Text(
                _dataOnBoarding[_indexBoard.value]['title'],
                textAlign: TextAlign.center,
                style: FontStyle.heading1,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _dataOnBoarding[_indexBoard.value]['desc'],
                textAlign: TextAlign.center,
                style: FontStyle.body1,
              ),
              const Spacer(),

              ButtonCustom.buttonPrimary(
                onTap: () {
                  _indexMove.value++;
                  if (_indexBoard.value <= _dataOnBoarding.length - 2) {
                    _indexBoard.value++;
                    _pageCountroll.jumpToPage(_indexBoard.value);
                  } else if (_indexMove.value == 4) {
                    RouteWidget.pushReplacment(
                        context: context, page: LoginPage());
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
