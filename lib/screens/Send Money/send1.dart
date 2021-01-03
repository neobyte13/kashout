import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kashout/screens/Send Money/send2.dart';
import 'package:kashout/utils/colors.dart';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  TextEditingController accountController = TextEditingController();

  process() async {
    if (accountController.text.isNotEmpty) {
      try {
        dynamic accountNo;
        dynamic accountNa;

        await FirebaseFirestore.instance
            .collection("users")
            .where("accountNumber",
                isEqualTo: accountController.text.toString().trim())
            .limit(1)
            .get()
            .then((value) {
          value.docs.forEach((result) {
            print(result.data());
            accountNo = result.data()["accountNumber"].toString();
            accountNa = result.data()["displayName"].toString();
            print(accountNa);
            print(accountNo);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    Send2(accNo: accountNo, accNa: accountNa)));
          });
        });
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:
                  Text("An error occurred. Please confirm the account number"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    accountController.clear();
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
            title: Text('Please enter a correct account number'),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  accountController.clear();
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
    return Scaffold(
      backgroundColor: colors["background"],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
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
              margin: EdgeInsets.only(left: 80.0, bottom: 15.0, right: 80.0),
              child: Text(
                "Send money instantly to anywhere in the world",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Color.fromRGBO(242, 242, 242, 1),
                    primaryColorDark: Color.fromRGBO(242, 242, 242, 1),
                  ),
                  child: TextFormField(
                    controller: accountController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(242, 242, 242, 1),
                              width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(242, 242, 242, 1),
                              width: 0.0),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.search,
                            color: colors["primary"],
                          ),
                        ),
                        hintText: "Enter account number"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Divider(
              height: 0.1,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Suggestion from recents',
                      style: TextStyle(
                        fontFamily: "worksans",
                        fontSize: 16,
                        color: Color.fromRGBO(157, 157, 157, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                        ),
                        title: Text('Daniel Etuk',
                            style: TextStyle(fontFamily: "worksans")),
                        subtitle: Text('556277757',
                            style: TextStyle(fontFamily: "worksans")),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Send2()));
                        },
                      ),
                      // ListTile(
                      //   leading: Container(
                      //     width: 60,
                      //     height: 60,
                      //     child: CircleAvatar(
                      //       backgroundColor: Colors.transparent,
                      //       backgroundImage: AssetImage(
                      //           'assets/images/if_9_avatar_2754584.png'),
                      //     ),
                      //   ),
                      //   title: Text('Von Neumann',
                      //       style: TextStyle(fontFamily: "worksans")),
                      //   subtitle: Text('392003413',
                      //       style: TextStyle(fontFamily: "worksans")),
                      // ),
                      // ListTile(
                      //   leading: Container(
                      //     width: 60,
                      //     height: 60,
                      //     child: CircleAvatar(
                      //       backgroundColor: Colors.transparent,
                      //       backgroundImage: AssetImage(
                      //           'assets/images/if_12_avatar_2754577.png'),
                      //     ),
                      //   ),
                      //   title: Text('Ayo',
                      //       style: TextStyle(fontFamily: "worksans")),
                      //   subtitle: Text('298840126',
                      //       style: TextStyle(fontFamily: "worksans")),
                      // ),
                      // ListTile(
                      //   leading: Container(
                      //     width: 60,
                      //     height: 60,
                      //     child: CircleAvatar(
                      //       backgroundColor: Colors.transparent,
                      //       backgroundImage: AssetImage(
                      //           'assets/images/if_8_avatar_2754583.png'),
                      //     ),
                      //   ),
                      //   title: Text('Chika',
                      //       style: TextStyle(fontFamily: "worksans")),
                      //   subtitle: Text('912309456',
                      //       style: TextStyle(fontFamily: "worksans")),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                margin: EdgeInsets.only(top: 30.0),
                width: MediaQuery.of(context).size.width - 90.0,
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
                process();
              },
            ),
          ],
        ),
      ),
    );
  }
}
