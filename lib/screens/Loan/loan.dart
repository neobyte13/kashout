import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kashout/utils/colors.dart';

class LoanScreen extends StatefulWidget {
  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();

  processLoan() async {
    if (_amountController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                "Your loan request is being reviewed and you will be notified of the status in 36 hours."),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () async {
                  try {
                    //_showNotification();
                    var firebaseUser = FirebaseAuth.instance.currentUser;
                    int oldAccountBalance = 0;

                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(firebaseUser.uid)
                        .get()
                        .then((value) {
                      oldAccountBalance = value.data()["accountBalance"];
                    });

                    int newAccountBalance =
                        oldAccountBalance + int.parse(_amountController.text);

                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(firebaseUser.uid)
                        .update({"accountBalance": newAccountBalance}).then(
                            (_) {
                      print("success!");
                    });

                    await Navigator.of(context).pushReplacementNamed("/home");
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
                                _amountController.clear();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please enter the amount you want to borrow'),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _amountController.clear();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
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
                                image: AssetImage("assets/images/Icon005.png"),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 80.0, bottom: 15.0, right: 80.0),
                        child: Text(
                          "Get a loan now, completely hassle free",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50.0, 0, 50.0, 30.0),
                        child: Text(
                          "Fill in the following to begin processing your request",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0, height: 1.6),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30.0),
                        margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(9.0),
                              margin: EdgeInsets.only(right: 15.0),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  shape: BoxShape.circle),
                              child: Text(
                                "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Quick Notice",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 4.0),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 9.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(180.0),
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(
                                                  253, 177, 161, 1.0),
                                              Color.fromRGBO(
                                                  255, 128, 158, 1.0),
                                            ])),
                                        child: Text(
                                          "Demo App",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Get any amount you need",
                                  style: TextStyle(height: 1.4),
                                ),
                                Text("There is no current verification system",
                                    style: TextStyle(height: 1.4))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(9.0),
                              margin: EdgeInsets.only(right: 15.0),
                              // decoration: BoxDecoration(
                              //     color: Colors.greenAccent,
                              //     shape: BoxShape.circle),
                              // child: Text(
                              //   "2",
                              //   style:
                              //       TextStyle(color: Colors.white, fontSize: 17.0),
                              // ),
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
                                controller: _amountController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'Loan Amount',
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                          processLoan();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
