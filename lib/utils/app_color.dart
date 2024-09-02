import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static const Color bgcolor = Color(0xff000000);
  static const Color baseColor = Color(0xff008080);
  static const Color red = Color(0xffff0000);
  static const Color sectioncolor = Color(0xff212121);
  static const Color color_2 = Color(0xff134f5c);
  static const Color color_4 = Color(0xff276070);
  static const Color color_3 = Color(0xff575a65);
  static const Color marron_ = Color(0xff4b1f1f);
  static const Color white = Color(0xffffffff);
  static const Color white2 = Color(0xffe8e8e8);
  static const Color green_ = Color(0xff00360b);
  static const Color coffie_ = Color(0xff622d2d);
  static const Color denim_ = Color(0xff52869f);
  static const Color denim_2 = Color(0xff3e5e70);
  static const Color black_ = Color(0xff000000);
  static const Color black_2 = Color(0xff656565);
  static const Color navy_ = Color(0xff244855);
  static const Color navy2 = Color(0xffd0ff00);
  static const Color yollow_ = Color(0xfffffa00);
}

TextStyle style1(textcolor) {
  return TextStyle(
    color: textcolor ?? Colors.red,

  );
}
