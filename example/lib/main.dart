import 'package:apiHandler/apiCaller.dart';
import 'package:apiHandler/apiHandler.dart';
import 'package:apiHandler/model/wealthManagement/card_trans_rule.dart';
import 'package:apiHandler/web3dart.dart';
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
  int _counter = 0;

  @override
  void initState() {
    super.initState();
   // testingModelData();
    checkNetwork();
  }


  void _incrementCounter() {
    Web3dart().getOwnerAddress();
    Web3dart().sendETHTransaction();
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  void testingModelData(){
    RetrieveCardTransRule cardTransRule = RetrieveCardTransRule(data: CardTransRuleRequest(appId: common.appId,timezone: 12,cardId: "abcs"));
    cardTransRule.sign = "abc";
    cardTransRule.phone = "12345678";
    cardTransRule.phoneCode = "86";
    cardTransRule.email = "abcd@gmail.com";
    // print("object.toString():${cardTransRule.toString()}");
    // print("object.toJson():${cardTransRule.toJson()}");
  }

  void checkNetwork() async{
    //checkConnectivity
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    print("start connectivityResult:$connectivityResult");

    // onConnectivityChanged
    apiHandler.onConnectivityChanged.listen((ConnectivityResult result) {
      print("ConnectivityResult:$result");
    });
  }

  // void callApi() async{
  //   String phoneCode = "86";
  //   String phone = "12345673";
  //   String smsCode = "000000";
  //   await apiCaller.updateDevice(phoneCode: phoneCode,phone: phone,code: smsCode,email: "");
  //   await apiCaller.signIn(phoneCode: phoneCode,phone: phone,code: smsCode);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:  Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trail
      ),
    );
  }
}
