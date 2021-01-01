import 'package:flutter/material.dart';
import 'package:kashout/utils/colors.dart';

class ProceedToLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: colors["background"],
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 25.0),
                    child: Container()),
                Container(
                  margin: EdgeInsets.only(top: 15.0, bottom: 20.0),
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Icon006.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Congratulations",
                    style: TextStyle(
                      color: colors["primary"],
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50.0, 0, 50.0, 45.0),
                  child: Text(
                    "You are now registered. Get started with Kashout",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, height: 1.6),
                  ),
                ),
                SizedBox(height: size.height * 0.2),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Proceed to Login",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: colors["primary"],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: colors["primary"],
                        size: 18.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
