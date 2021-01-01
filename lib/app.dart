import 'package:flutter/material.dart';
import 'package:kashout/screens/Authentication/Login/login.dart';
import 'package:kashout/screens/Authentication/Signup/fingerprint.dart';
import 'package:kashout/screens/Authentication/Signup/proceedToLogin.dart';
import 'package:kashout/screens/Authentication/Signup/register.dart';
import 'package:kashout/screens/Authentication/authStart.dart';
import 'package:kashout/screens/Home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Avenir Next"),
      initialRoute: '/auth-start',
      routes: {
        "/register": (context) => Registration(),
        "/auth-start": (context) => AuthStart(),
        "/fingerprint": (context) => Fingerprint(),
        "/proceed-to-login": (context) => ProceedToLogin(),
        "/login": (context) => Login(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
