import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kashout/utils/colors.dart';
import 'package:kashout/utils/customIcon.dart';
import 'package:kashout/utils/sharedPrefs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget listQuickActions() {
    return Container(
      height: 304,
      child: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x04000000),
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0.0, 8.0))
                ],
                color: Color(0xFFFFFFFF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF9F9F9),
                        image: DecorationImage(
                          image: AssetImage('assets/images/topup.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Mobile Top Up',
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121)),
                        ),
                        Text(
                          'Buy airtime or data',
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0x50212121)),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x04000000),
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0.0, 8.0))
                ],
                color: Color(0xFFFFFFFF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF9F9F9),
                        image: DecorationImage(
                          image: AssetImage('assets/images/send.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Send Money',
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121)),
                        ),
                        Text(
                          'Easily send money anywhere',
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0x50212121)),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x04000000),
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0.0, 8.0))
                ],
                color: Color(0xFFFFFFFF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF9F9F9),
                        image: DecorationImage(
                          image: AssetImage('assets/images/pay.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Pay Bills',
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121)),
                        ),
                        Text(
                          'Pay all bills from a single spot',
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0x50212121)),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('/loan'),
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              height: 68,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x04000000),
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(0.0, 8.0))
                  ],
                  color: Color(0xFFFFFFFF)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF9F9F9),
                          image: DecorationImage(
                            image: AssetImage('assets/images/request.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Loans',
                            style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF212121)),
                          ),
                          Text(
                            'Get loans completely hassle free',
                            style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0x50212121)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: colors["background"],
      body: Container(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(firebaseUser.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(
                            MyFlutterApp.navigation_drawer,
                            color: colors["primary"],
                          ),
                          onTap: () {},
                        ),
                        Text(
                          "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: colors["primary"]),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.notifications_active,
                            size: 20.0,
                            color: colors["primary"],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 8, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${sharedPrefs.username}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            height: 1.6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 175,
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        margin: EdgeInsets.only(right: 8),
                        height: 175,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFF5F5F5),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x10000000),
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: Offset(0.0, 8.0))
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 16,
                              top: 12,
                              child: Image.asset(
                                "assets/images/mastercard_logo.png",
                                height: 22,
                                width: 33,
                              ),
                            ),
                            Positioned(
                              top: 63,
                              left: 16,
                              child: Text(
                                'Current Balance',
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0x50212121)),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 81,
                              child: Text(
                                '₦ ' +
                                    snapshot.data["accountBalance"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF212121),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 30,
                              child: Text(
                                'Account Number',
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0x50212121)),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 12,
                              child: Text(
                                snapshot.data["accountNumber"],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF212121)),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              bottom: 8,
                              child: SvgPicture.asset(
                                "assets/icons/more_icon_grey.svg",
                                height: 24,
                                width: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24, top: 32, bottom: 16, right: 24),
                    child: Text(
                      'Quick actions',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        //color: colors["primary"],
                      ),
                    ),
                  ),
                  listQuickActions(),
                ],
              );
            }),
      ),
    );
  }
}
