import 'package:agent_mobile_app/helper/margin_layout.dart';
import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:agent_mobile_app/providers/profile/account_provider.dart';
import 'package:agent_mobile_app/providers/reward/reward_providers.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardDetailPage extends StatefulWidget {
  final int id;
  const RewardDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<RewardDetailPage> createState() => _RewardDetailPageState();
}

class _RewardDetailPageState extends State<RewardDetailPage> {
  final GlobalKey<FormState> _numbuerKey = GlobalKey<FormState>();

  final TextEditingController _inputNumber = TextEditingController(text: '+62');

  @override
  void initState() {
    super.initState();
    context.read<RewardsProviders>().detailReward(id: widget.id.toString());
    context.read<AccountProvider>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBarDefault(
        context,
        backgroundColor: ColorApp.primaryA3,
        colorComponen: Colors.white,
        title: 'Detail Reward',
      ),
      bottomNavigationBar: Padding(
          padding: Marginlayout.marginhorizontal.copyWith(bottom: 40),
          child: Consumer2<AccountProvider, RewardsProviders>(
            builder: (context, dataAccount, dataReward, _) =>
                ButtonCustom.buttonPrimary(
              onTap: () {
                if (dataAccount.isLoading == false &&
                    dataAccount.dataAccount.userCoin!.amount! >=
                        dataReward.dataDetail.requiredPoint!) {
                  _dialogRedeem(context);
                }
              },
              colorBtn: dataAccount.isLoading == true
                  ? ColorApp.secondaryB2
                  : dataAccount.dataAccount.userCoin!.amount! <
                          dataReward.dataDetail.requiredPoint!
                      ? ColorApp.secondaryB2
                      : ColorApp.primaryA3,
              text: dataAccount.isLoading == true
                  ? '••••••••'
                  : dataAccount.dataAccount.userCoin!.amount! <
                          dataReward.dataDetail.requiredPoint!
                      ? 'Oups, dikoin kamu belum cukup'
                      : 'Redeem Sekarang',
            ),
          )),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            color: ColorApp.primaryA3,
            child: const Icon(
              Icons.phone_android_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: Marginlayout.marginhorizontal,
            child: Consumer<RewardsProviders>(
                builder: (context, dataDetail, _) => ListView(
                      children: [
                        _overViewReward(context, dataDetail: dataDetail),
                        Text(
                          'Deskripsi',
                          style: FontStyle.subtitle1SemiBold,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        //NOTE Data Deskripsi
                        Text(
                          dataDetail.loadingDetail == true
                              ? 'Loading...'
                              : dataDetail.dataDetail.description!,
                          style: FontStyle.subtitle2,
                        ),
                      ],
                    )),
          ),
        ],
      ),
    );
  }

  Future _dialogRedeem(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Redeem Poin',
              style: FontStyle.subtitle1SemiBold,
            ),
            const SizedBox(
              height: 16,
            ),
            //NOTE Data Deskripsi
            Text(
              'Masukan Nomor Handphone Terlebih dahulu sebelum anda melakukan Redeem poin.',
              style: FontStyle.subtitle2,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom / 2),
              child: Form(
                  key: _numbuerKey,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: _inputNumber,
                      validator: (String? error) {
                        if (error!.isEmpty) {
                          return 'Field ini tidak boleh kosong*';
                        } else if (error.startsWith('+62') == false) {
                          return 'Format harus +62*';
                        } else if (error.length < 13) {
                          return 'panjang nomor harus 12*';
                        }
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: ColorApp.primaryA3,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 10),
                        isCollapsed: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorApp.primaryA3)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          child: Image.asset(
                            'assets/icons/call.png',
                            height: 12,
                          ),
                        ),
                        hintText: '+62**********',
                        fillColor: ColorApp.primaryA3,
                        focusColor: ColorApp.primaryA3,
                        hoverColor: ColorApp.primaryA3,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                BorderSide(color: ColorApp.secondaryEA)),
                        hintStyle: FontStyle.body2
                            .copyWith(color: ColorApp.secondaryB2),
                      ),
                    ),
                  )),
            ),

            const SizedBox(
              height: 70,
            ),
            ValueListenableBuilder<bool>(
                valueListenable: context.read<RewardsProviders>().processRedeem,
                builder: (context, load, _) {
                  if (load == true) {
                    return ButtonCustom.buttonLoading();
                  } else {
                    return ButtonCustom.buttonPrimary(
                      onTap: () async {
                        if (_numbuerKey.currentState!.validate() == true) {
                          await context
                              .read<RewardsProviders>()
                              .redeemReward(id: widget.id);
                          _inputNumber.clear();
                        }
                      },
                      colorBtn: ColorApp.primaryA3,
                      text: 'Redeem Sekarang',
                    );
                  }
                }),
            const SizedBox(
              height: 16,
            ),
            ButtonCustom.buttonSeccondary(
              onTap: () => Navigator.pop(context),
              text: 'Nanti deh',
            ),
          ],
        );
      },
    );
  }

  Widget _overViewReward(BuildContext context,
      {required RewardsProviders dataDetail}) {
    return Container(
        margin: EdgeInsets.only(
            bottom: 24, top: MediaQuery.of(context).size.height * 0.2),
        width: double.infinity,
        padding: Marginlayout.marginhorizontal.copyWith(top: 16, bottom: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CustomShadow.md,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  dataDetail.loadingDetail == true
                      ? 'Loading...'
                      : dataDetail.dataDetail.category!.name! != ''
                          ? dataDetail.dataDetail.category!.name!
                          : '-',
                  style: FontStyle.caption,
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/coin.png',
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${dataDetail.loadingDetail == true ? 'Loading...' : dataDetail.dataDetail.requiredPoint} Koin',
                  style: FontStyle.subtitle1SemiBold,
                ),
              ],
            ),
            Text(
              dataDetail.loadingDetail == true
                  ? 'Loading...'
                  : dataDetail.dataDetail.name!,
              style: FontStyle.heading1,
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              color: ColorApp.secondaryB2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Berlaku Sampai dengan',
                    style: FontStyle.subtitle2,
                  ),
                ),
                Text(
                  dataDetail.loadingDetail == true
                      ? 'Loading...'
                      : dataDetail.dataDetail.validUntil! != ''
                          ? context.read<RewardsProviders>().parseDate(
                              dataDetail.dataDetail.validUntil!, 'dd MMMM yyyy')
                          : '-',
                  style: FontStyle.subtitle2,
                ),
              ],
            ),
          ],
        ));
  }
}
