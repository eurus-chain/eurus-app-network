import 'package:apihandler/apiHandler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // testingModelData();
  }

  void _incrementCounter() {
    checkNetwork();
    setState(() {
      _counter++;
    });
  }

  void checkNetwork() async {
    //checkConnectivity
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
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
          child: Text(
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
