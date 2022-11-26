import 'package:agent_mobile_app/helper/shadow.dart';
import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardPoinReward extends StatelessWidget {
  const CardPoinReward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, top: 5, bottom: 5),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: CustomShadow.md,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorApp.primaryA3,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                boxShadow: CustomShadow.md,
              ),
              child: const Icon(
                Icons.phone_android_rounded,
                color: Colors.white,
                size: 46,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pulsa',
                  style: FontStyle.caption,
                ),
                Expanded(
                  child: Text(
                    'Pulsa 25.000 ',
                    style: FontStyle.subtitle2SemiBold,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/coin.png',
                      height: 12,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 4,),
                    Text(
                    '100 Koin',
                    style: FontStyle.caption,
                  ),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
