import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amap/amap.dart';

void main() {
  const MethodChannel channel = MethodChannel('amap');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Amap.platformVersion, '42');
  });
}
