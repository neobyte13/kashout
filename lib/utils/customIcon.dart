import 'package:flutter/widgets.dart';

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFamNavDrawer = 'nav_drawer';
  static const _kFontFamSlide = 'slide_icon';
  static const _kFontPkg = null;

  static const IconData navigation_drawer =
      IconData(0xe800, fontFamily: _kFontFamNavDrawer, fontPackage: _kFontPkg);
  static const IconData slide_icon =
      IconData(0xe801, fontFamily: _kFontFamSlide, fontPackage: _kFontPkg);
}
