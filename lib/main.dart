import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kashout/app.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}
