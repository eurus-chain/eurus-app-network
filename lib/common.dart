import 'dart:convert';

import 'dart:typed_data';

import 'model/myuser.dart';

class Common {
  static final Common _instance = Common._internal();

  Common._internal() {
    // init things inside this
  }

  factory Common() {
    return _instance;
  }

   String getBase64Decode(String src) {
    try {
      if (src != null) {
        Uint8List dSrc = base64Decode(src);
        if (dSrc != null) {
          src = utf8.decode(dSrc);
        }
      }
    } catch (e) {
      print(e);
    }
    return src;
  }


  int currentTimeInSeconds() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  String deviceId;
  String appId;
  String appUpdateUrl;
  MyUser user;
  String serverUrl;
  bool isPhoneLogin = true;
  String clientType = '11';
}

Common common = Common();
