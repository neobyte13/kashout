import 'package:flutter/material.dart';
import 'package:kashout/utils/colors.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: colors["background"],
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.arrow_back_ios, size: 20.0),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Step 1/2",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: colors["primary"]),
                      ),
                      Icon(Icons.arrow_back_ios,
                          size: 20.0, color: colors["background"]),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0, bottom: 20.0),
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Icon002.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Register",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50.0, 0, 50.0, 45.0),
                  child: Text(
                    "Fill in the following details to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, height: 1.6),
                  ),
                ),
                Container(
                  width: size.width - 50.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: size.width - 70.0,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 13.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(
                                    Icons.text_fields,
                                    color: Colors.black26,
                                  ),
                                  Container(
                                    width: size.width - 210,
                                    // child: Text(
                                    //   "(+62)  8128008011",
                                    //   style: TextStyle(
                                    //       fontSize: 17.0,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black87),
                                    // )
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                          labelText: 'Enter your full name',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.all(5.0),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.greenAccent,
                                  //     shape: BoxShape.circle,
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //           color: Colors.black26,
                                  //           blurRadius: 2.0,
                                  //           offset: Offset(2.0, 2.0)),
                                  //     ],
                                  //   ),
                                  //   child: Icon(Icons.check,
                                  //       color: Colors.white, size: 16.0),
                                  // )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(
                                    Icons.email,
                                    color: Colors.black26,
                                  ),
                                  Container(
                                    width: size.width - 210,
                                    // child: Text(
                                    //   "(+62)  8128008011",
                                    //   style: TextStyle(
                                    //       fontSize: 17.0,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black87),
                                    // )
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          labelText: 'Enter your email address',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(
                                    Icons.lock,
                                    color: Colors.black26,
                                  ),
                                  Container(
                                    width: size.width - 210,
                                    // child: Text(
                                    //   "(+62)  8128008011",
                                    //   style: TextStyle(
                                    //       fontSize: 17.0,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black87),
                                    // )
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText: 'Enter a strong password',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          margin: EdgeInsets.only(top: 30.0),
                          width: size.width - 90.0,
                          decoration: BoxDecoration(
                            color: colors["primary"],
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                          child: Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff)),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/fingerprint");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
