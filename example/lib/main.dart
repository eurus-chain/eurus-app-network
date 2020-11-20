import 'package:apihandler/apiCaller.dart';
import 'package:apihandler/apiHandler.dart';
import 'package:apihandler/model/wealthManagement/card_trans_rule.dart';
import 'package:apihandler/web3dart.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:apihandler/common.dart';

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
  }


  void _incrementCounter() {
    checkNetwork();
    web3dart.getOwnerAddress();
    Future.delayed(Duration(milliseconds: 1000), () {
      web3dart.setUpPrivateKey(privateKey:'0x7e0480ca9fd50eb7a3855cf53c347a1b4d6a2ff5');
      web3dart.sendETHTransaction(amount: EtherAmount.fromUnitAndValue(EtherUnit.finney, 1),toAddress:'0xA3B4dE5E90A18512BD82c1A640AC99b39ef2258A');
      web3dart.getETHClientDetail();
    });
    Future.delayed(Duration(milliseconds: 4000), () {
      web3dart.getAddressDetail();
      web3dart.sendERC20Transaction(contractAddress: '0x7e0480ca9fd50eb7a3855cf53c347a1b4d6a2ff5',amount: BigInt.from(1000000000000000000),toAddress:'0xA3B4dE5E90A18512BD82c1A640AC99b39ef2258A');
    });
    setState(() {
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
