import 'package:flutter/services.dart';

class ProjectPlugin {
  static MethodChannel _methodChannel = MethodChannel('com.tradwang.sample/plugin_method_channel');

  static Future<String> getAppVersion() async {
    return _methodChannel.invokeMethod('getAppVersion');
  }
}
