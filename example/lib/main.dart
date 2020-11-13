import 'package:apiHandler/apiCaller.dart';
import 'package:apiHandler/apiHandler.dart';
import 'package:apiHandler/model/wealthManagement/card_trans_rule.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:apiHandler/common.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = '10';

  @override
  void initState() {
    super.initState();
    demoMethod();
  }
  
  void demoMethod() async{
    RetrieveCardTransRule cardTransRule = RetrieveCardTransRule(data: CardTransRuleRequest(appId: common.appId,timezone: 12,cardId: "abcs"));
    cardTransRule.sign = "abc";
    cardTransRule.phone = "12345678";
    cardTransRule.phoneCode = "86";
    cardTransRule.email = "abcd@gmail.com";
    print("object.toString():${cardTransRule.toString()}");
    print("object.toJson():${cardTransRule.toJson()}");

    //checkConnectivity
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    print("start connectivityResult:$connectivityResult");

    // onConnectivityChanged
    apiHandler.onConnectivityChanged.listen((ConnectivityResult result) {
      print("ConnectivityResult:$result");
    });

    apiCaller.signIn(phoneCode: "86",phone: "12345673",smsCode: "000000");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
