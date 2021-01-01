import 'package:flutter/material.dart';
import 'package:kashout/utils/colors.dart';

class AuthStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(color: colors["background"]),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: size.width - 135.0,
                        height: size.width - 160.0,
                        margin: EdgeInsets.only(top: 50.0, bottom: 35.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/Icon001.png"),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Get started",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          "Never a better time than now to start thinking about how you'll manage all your finances with ease.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0, height: 1.6),
                        ),
                      )
                    ],
                  ),
                ),
                /*** footer ***/
                Container(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          margin: EdgeInsets.only(bottom: 30.0),
                          width: size.width - 50.0,
                          decoration: BoxDecoration(
                            color: colors["primary"],
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                          child: Text(
                            "Create Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff)),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Text(
                            "Login to Account",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: colors["primary"]),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/login");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
