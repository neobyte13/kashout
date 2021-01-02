import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kashout/screens/Send Money/send2.dart';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  TextEditingController accountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                            color: Colors.yellow,
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
                            backgroundImage: AssetImage(
                                'assets/images/if_3_avatar_2754579.png'),
                          ),
                        ),
                        title: Text('Daniel',
                            style: TextStyle(fontFamily: "worksans")),
                        subtitle: Text('348219093',
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
            )
          ],
        ),
      ),
    );
  }
}
