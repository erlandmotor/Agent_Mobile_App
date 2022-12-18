import 'package:agent_mobile_app/helper/themes_colors.dart';
import 'package:agent_mobile_app/helper/themse_fonts.dart';
import 'package:flutter/material.dart';

/// class ini kumpulan appbar custom yang dapat dipanggil berkali kali
class CustomAppBar {
  static PreferredSizeWidget appBarDefault(BuildContext context,
      {required Color backgroundColor,
      required Color colorComponen,
      List<Widget>? action,
      required String title}) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: colorComponen,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        title,
        style: FontStyle.heading1.copyWith(color: colorComponen),
      ),
      actions: action ?? [],
    );
  }

  static PreferredSizeWidget appBarDefaultSecond(BuildContext context,
      {required Color backgroundColor,
      required Color colorComponen,
      List<Widget>? action,
      required String title}) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: colorComponen,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        title,
        style: FontStyle.headline6Bold.copyWith(color: colorComponen),
      ),
      actions: action ?? [],
    );
  }

  static PreferredSizeWidget appBarWithTabBar(BuildContext context,
      {required Color backgroundColor,
      required Color colorComponen,
      List<Widget>? tabBar,
      List<Widget>? action,
      required String title}) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 2,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: colorComponen,
        ),
      ),
      titleSpacing: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Material(
          color: Colors.white,
          child: SizedBox(
            height: 45,
            child: TabBar(
              tabs: tabBar ?? [],
              labelStyle: FontStyle.caption,
              labelColor: ColorApp.secondary00,
              // : FontStyle.caption,
              indicatorColor: ColorApp.primaryA3,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: FontStyle.heading1.copyWith(color: colorComponen),
      ),
      actions: action ?? [],
    );
  }

  static PreferredSizeWidget appBarWithTabBarSecond(BuildContext context,
      {required Color backgroundColor,
      required Color colorComponen,
      List<Widget>? tabBar,
      List<Widget>? action,
      required String title}) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: colorComponen,
        ),
      ),
      titleSpacing: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Material(
          color: Colors.white,
          child: SizedBox(
            height: 45,
            child: TabBar(
              tabs: tabBar ?? [],
              labelStyle: FontStyle.subtitle1SemiBold,
              labelColor: ColorApp.secondary00,
              // : FontStyle.caption,
              indicatorColor: ColorApp.primaryA3,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: FontStyle.heading1.copyWith(color: colorComponen),
      ),
      actions: action ?? [],
    );
  }
}
