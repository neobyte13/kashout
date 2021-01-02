import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kashout/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: colors["background"],
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
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
                          "",
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
                      "Login",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50.0, 0, 50.0, 45.0),
                    child: Text(
                      "Enter your username and password to continue",
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
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            labelText: 'Email Address',
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
                                        controller: _passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
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
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            ),
                          ),
                          onTap: () async {
                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              try {
                                User user = (await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ))
                                    .user;
                                if (user != null) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                      'displayName', user.displayName);
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                }
                              } catch (e) {
                                print(e);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: new Text(e.toString()),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: new Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            _emailController.clear();
                                            _passwordController.clear();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Please enter the required details'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          _emailController.clear();
                                          _passwordController.clear();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
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
      ),
    );
  }
}
