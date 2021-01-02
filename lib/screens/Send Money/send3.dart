import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'package:community_material_icon/community_material_icon.dart';

class Send3 extends StatefulWidget {
  @override
  _Send3State createState() => _Send3State();
}

class _Send3State extends State<Send3> {
  var textFormFieldController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  bool _isButtonDisabled = true;

  @override
  void initState() {
    textFormFieldController.updateValue(0.00);
    super.initState();
  }

  _checkInputForConfirm(double amount) {
    if (amount > 0.0) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  _startPayment() {
    Navigator.of(context).pop(textFormFieldController.numberValue);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Enter amount',
              style: TextStyle(fontFamily: "worksans", color: Colors.black),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(CommunityMaterialIcons.close_circle,
                    color: Colors.black),
                onPressed: () {
                  Navigator.of(context)
                      .pop(textFormFieldController.numberValue);
                },
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'NGN',
                            style: TextStyle(fontFamily: "sfprotext"),
                          ),
                        ),
                        Spacer(flex: 1),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 2,
                          child: TextField(
                            controller: textFormFieldController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    top: 13, start: 25),
                                child: Text(
                                  '\$',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              prefixStyle: TextStyle(
                                  fontFamily: "vistolsans", fontSize: 25),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontFamily: "sfprotext",
                                color: Colors.black,
                                fontSize: 50),
                            onChanged: (text) {
                              _checkInputForConfirm(double.parse(text));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: FlatButton(
                        color: Color.fromRGBO(18, 106, 175, 1),
                        textColor: Color.fromRGBO(18, 106, 175, 1),
                        disabledColor: Color.fromRGBO(157, 157, 157, 1),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              fontFamily: "worksans",
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                        // onPressed: null,
                        onPressed:
                            _isButtonDisabled ? null : () => _startPayment(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
