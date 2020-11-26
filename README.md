# connectivity

This plugin allows Flutter apps to discover network connectivity and configure
themselves accordingly. It can distinguish between cellular vs WiFi connection.
This plugin works for iOS and Android.

> Note that on Android, this does not guarantee connection to Internet. For instance,
the app might have wifi access but it might be a VPN or a hotel WiFi with no access.

## Usage

Sample usage to check current status:

```dart
import 'package:apihandler/apiHandler.dart';

var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
}
```

> Note that you should not be using the current network status for deciding
whether you can reliably make a network connection. Always guard your app code
against timeouts and errors that might come from the network layer.

You can also listen for network state changes by subscribing to the stream
exposed by connectivity plugin:

```dart
import 'package:apihandler/apiHandler.dart';

void checkNetwork() async{

    // onConnectivityChanged
    apiHandler.onConnectivityChanged.listen((ConnectivityResult result) {
      print("ConnectivityResult:$result");
    });
  }
```
