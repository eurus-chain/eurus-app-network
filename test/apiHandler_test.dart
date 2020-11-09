import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apiHandler/apiHandler.dart';


void main() {
  const MethodChannel channel = MethodChannel('apiHandler');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ApiHandler.platformVersion, '42');
  });
}
