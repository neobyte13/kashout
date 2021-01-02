import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:kashout/screens/Send%20Money/send3.dart';
import 'package:kashout/utils/colors.dart';

class Send2 extends StatefulWidget {
  @override
  _Send2State createState() => _Send2State();
}

class _Send2State extends State<Send2> with SingleTickerProviderStateMixin {
  String amountValue = '0.00';
  bool showAddNote = false;
  bool showPageLoader = false;
  bool showSpinner = false;
  bool showChecked = false;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationController.addListener(() {
      if (animationController.status.toString() ==
          'AnimationStatus.completed') {
        setState(() {
          showSpinner = false;
          showChecked = true;
        });
        Timer(
          Duration(seconds: 1),
          () => setState(() {
            showPageLoader = false;
            Navigator.of(context).pop();
          }),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startPayment() {
    setState(() {
      showPageLoader = true;
      showSpinner = true;
      animationController.forward();
    });
  }

  Widget _showPageLoader() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 10,
              sigmaX: 10,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        showSpinner
            ? Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/jenius_logo.png', height: 35),
              )
            : Container(),
        showSpinner
            ? Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 2.0).animate(animationController),
                  child: Image.asset('assets/images/loading.png'),
                ),
              )
            : Container(),
        showChecked
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/checked.png'),
                    SizedBox(height: 25),
                    Material(
                      child: Text(
                        'Transaction Successful',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(61, 179, 158, 1)),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: 150,
        child: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                title: Text('Send to Daniel',
                    style: TextStyle(color: Colors.black)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Daniel Etuk',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 25,
                        child: FlatButton(
                          color: colors["primary"],
                          textColor: Colors.white,
                          child: Text(
                            "674532196",
                            style: TextStyle(
                                fontFamily: "worksans",
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Amount',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'NGN',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(157, 157, 157, 1)),
                                    ),
                                    SizedBox(width: 5),
                                    InkWell(
                                      child: Text(
                                        this.amountValue.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onTap: () async {
                                        var navigationResult =
                                            await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Send3(),
                                            fullscreenDialog: true,
                                          ),
                                        );
                                        setState(() {
                                          this.amountValue =
                                              navigationResult.toString();
                                          if (navigationResult.toString() !=
                                              '0.0') {
                                            this.showAddNote = true;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(
                                height: 0.1,
                                color: Color.fromRGBO(157, 157, 157, 1)),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Transaction fees',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'NGN',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(157, 157, 157, 1)),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '0.00',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(
                                height: 0.1,
                                color: Color.fromRGBO(157, 157, 157, 1)),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                    'assets/images/mastercard_logo.png'),
                                Spacer(flex: 1),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Kashout Account',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '7865432123',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(157, 157, 157, 1)),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 5),
                                Icon(Icons.chevron_right,
                                    color: Color.fromRGBO(157, 157, 157, 1),
                                    size: 40),
                              ],
                            ),
                            SizedBox(height: 1),
                            Divider(
                                height: 0.1,
                                color: Color.fromRGBO(157, 157, 157, 1)),
                            SizedBox(height: 30),
                            Opacity(
                              opacity: this.showAddNote ? 1.0 : 0.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Add Note',
                                    style: TextStyle(
                                        fontSize: 17, color: colors["primary"]),
                                  ),
                                  Icon(Icons.chevron_right,
                                      color: Color.fromRGBO(157, 157, 157, 1),
                                      size: 40),
                                ],
                              ),
                            ),
                            SizedBox(height: 1),
                            Opacity(
                              opacity: this.showAddNote ? 1.0 : 0.0,
                              child: Divider(
                                  height: 0.1,
                                  color: Color.fromRGBO(157, 157, 157, 1)),
                            ),
                            SizedBox(height: 30),
                            Opacity(
                              // opacity: 1.0,
                              opacity: this.showAddNote ? 1.0 : 0.0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: FlatButton(
                                  color: colors["primary"],
                                  textColor: Color.fromRGBO(18, 106, 175, 1),
                                  disabledColor:
                                      Color.fromRGBO(157, 157, 157, 1),
                                  child: Text(
                                    "Send Now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  onPressed: () => _startPayment(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            showPageLoader ? _showPageLoader() : Container(),
          ],
        ),
      ),
    );
  }
}
