// import 'package:flutter/material.dart';
// import 'package:kashout/utils/colors.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Widget _buildActions() {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   width: 40,
//                   height: 40,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     backgroundImage: AssetImage('assets/images/send.png'),
//                   ),
//                 ),
//                 Text(
//                   "Send",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     height: 1.6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   width: 40,
//                   height: 40,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     backgroundImage: AssetImage('assets/images/pay.png'),
//                   ),
//                 ),
//                 Text(
//                   "Pay",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     height: 1.6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   width: 40,
//                   height: 40,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     backgroundImage: AssetImage('assets/images/topup.png'),
//                   ),
//                 ),
//                 Text(
//                   "Top Up",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     height: 1.6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   width: 40,
//                   height: 40,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     backgroundImage: AssetImage('assets/images/request.png'),
//                   ),
//                 ),
//                 Text(
//                   "Request",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     height: 1.6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         color: colors["background"],
//         child: ListView(
//           children: <Widget>[
//             Container(
//               height: size.height * 0.40,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0x9384ff),
//                     colors["primary"],
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         GestureDetector(
//                           child: Icon(Icons.menu_rounded, size: 20.0),
//                           onTap: () {},
//                         ),
//                         Text(
//                           "",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                               color: colors["primary"]),
//                         ),
//                         GestureDetector(
//                           child: Icon(Icons.notifications_active, size: 20.0),
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             width: 50,
//                             height: 50,
//                             child: CircleAvatar(
//                               backgroundColor: Colors.transparent,
//                               backgroundImage:
//                                   AssetImage('assets/images/avatar.png'),
//                             ),
//                           ),
//                           Column(
//                             children: <Widget>[
//                               Text(
//                                 "Daniel Etuk",
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                     fontSize: 16.0,
//                                     height: 1.6,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "389212803",
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(fontSize: 14.0, height: 1.4),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               "My Balance",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(fontSize: 16.0, height: 1.6),
//                             ),
//                             Text(
//                               "NGN 6,570,000",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontSize: 15.0,
//                                   height: 1.6,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 1.0,
//                         color: Colors.black,
//                       ),
//                       _buildActions(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Icon(Icons.payment),
//                               Text(
//                                 "Pay Bills",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 14.0, height: 1.6),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Icon(Icons.money),
//                               Text(
//                                 "Request Loan",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 14.0, height: 1.6),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Icon(Icons.wallet_giftcard),
//                               Text(
//                                 "Send Gift",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 14.0, height: 1.6),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Icon(Icons.history),
//                               Text(
//                                 "View Transactions",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 14.0, height: 1.6),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
