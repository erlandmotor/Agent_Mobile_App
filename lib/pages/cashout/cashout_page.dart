import 'package:agent_mobile_app/helper/routes.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/pages/cashout/body/body_choice_bank.dart';
import 'package:agent_mobile_app/pages/cashout/body/validate_bank.dart';
import 'package:agent_mobile_app/pages/cashout/widgets/dialog_nominal.dart';
import 'package:agent_mobile_app/pages/current_pages.dart';
import 'package:agent_mobile_app/widget_reusable/widget_appbar_default.dart';
import 'package:agent_mobile_app/widget_reusable/widget_button.dart';
import 'package:flutter/material.dart';

class CashoutPage extends StatelessWidget {
  CashoutPage({super.key});
  final ValueNotifier<bool> _isVerifBank = ValueNotifier<bool>(false);
  final ValueNotifier<String> _choiceBank = ValueNotifier<String>('');
  final TextEditingController _nominalCashout = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorApp.secondaryFF,
      appBar: CustomAppBar.appBarDefaultSecond(context,
          backgroundColor: ColorApp.primaryA3,
          colorComponen: ColorApp.secondaryFF,
          title: 'Tarik Tunai',
          action: [
            IconButton(
              onPressed: () {
                RouteWidget.pushReplacment(
                    context: context, page: const CurrentPages(index: 2));
              },
              icon: const Icon(
                Icons.help_outline_sharp,
                color: Colors.white,
              ),
            )
          ]),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _isVerifBank,
          builder: (context, verfBank, _) {
            if (verfBank == false) {
              return const SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ButtonCustom.buttonPrimary(
                    onTap: () {
                      dialogNominal(context, nominalCashout: _nominalCashout);
                    },
                    colorBtn: ColorApp.primaryA3,
                    text: 'Pilih Jumlah Nominal Sendiri'),
              );
            }
          }),
      body: ValueListenableBuilder<String>(
        valueListenable: _choiceBank,
        builder: (context, bank, _) {
          if (bank != '') {
            return BodyValidateBank(
              isVerifBank: _isVerifBank,
              iconBank: bank,
            );
          } else {
            return BodyChoiceBank(
              bank: _choiceBank,
            );
          }
        },
      ),
    );
  }
}
