import 'package:flutter/material.dart';

class FormKey {
  final GlobalKey<FormState> formKeySignin =
      GlobalKey<FormState>(debugLabel: 'sign-in');
  final GlobalKey<FormState> formKeySignUp =
      GlobalKey<FormState>(debugLabel: 'sign-up');
  final GlobalKey<NavigatorState> mNavigation = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
}
