import 'package:flutter/cupertino.dart';

/// class ini berisikan margin dan padding default
///
/// jika ingin menganti value gunakan => .copyWith() saat memanggil
class Marginlayout {
  /// horizontal 16
  static EdgeInsets marginhorizontal =
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets marginAll = const EdgeInsets.all(16);

  /// vertical 16
  static EdgeInsets marginVertical = const EdgeInsets.symmetric(vertical: 16);

  /// bottom 16
  static EdgeInsets marginBottom = const EdgeInsets.only(bottom: 16);

  /// top 16
  static EdgeInsets margintop = const EdgeInsets.only(top: 16);

  /// left 16
  static EdgeInsets marginLeft = const EdgeInsets.only(left: 16);

  /// bottom 16
  static EdgeInsets marginRight = const EdgeInsets.only(right: 16);
}
