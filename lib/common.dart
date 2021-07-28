import 'dart:convert';
import 'dart:typed_data';

class Common {
  static final Common _instance = Common._internal();

  Common._internal() {
    /// init things inside this
  }

  factory Common() {
    return _instance;
  }

  /// getBase64Decode
  String? getBase64Decode(String? src) {
    try {
      if (src != null) {
        Uint8List dSrc = base64Decode(src);
        if (dSrc.isNotEmpty) {
          src = utf8.decode(dSrc);
        }
      }
    } catch (e) {
      print(e);
    }
    return src;
  }

  /// get currentTimeInSeconds
  int currentTimeInSeconds() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  // String deviceId = "abcdefg";
  // String appId = "testingAppId";
  // String appUpdateUrl;
  // MyUser user;
  // String serverUrl;
  // bool isPhoneLogin = true;
  // String clientType = '11';
}

Common common = Common();
