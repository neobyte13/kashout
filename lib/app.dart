import 'package:flutter/material.dart';
import 'package:kashout/screens/Authentication/Signup/register.dart';
import 'package:kashout/screens/Authentication/authStart.dart';

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
      },
    );
  }
}
