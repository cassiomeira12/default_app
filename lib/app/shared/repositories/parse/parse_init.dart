import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParseInit {
  // static String appId = "123456";
  // static String serverUrl = "http://192.168.1.11:1337/parse";
  // static String clientKey = "123456";
  // static String restApiKet = "123456";

  static String appId = "vP5eyem24FCRjqbzvfTx7KKgRN7WMk7RGObRBQfk";
  static String serverUrl =
      "https://pg-app-umn8hkxj0yfqr3tue4vyhpzr5j1zst.scalabl.cloud/1/";
  static String clientKey = "hX0GOokmRVb1nQg4gjlM0n1RpkTk7NbWRgoQgBNH";
  static String restApiKet = "6O4o1phUq74aalaJ75qqRrz3kbQgNWQORBg5kR7R";

  static Parse parse;
  static bool _initParse = false;

  static Future<bool> init() async {
    if (parse == null) {
      _initParse = true;
      parse = await Parse().initialize(
        appId,
        serverUrl,
        appName: APP_NAME,
        liveQueryUrl: serverUrl,
        clientKey: clientKey,
        autoSendSessionId: true,
        debug: kDebugMode,
      );
      if (_initParse) {
        _initParse = false;
        initInstallation();
        if (kDebugMode) parse.healthCheck();
      }
    }
    return parse?.hasParseBeenInitialized();
  }

  static Future initInstallation() async {
    var installation = await ParseInstallation.currentInstallation();
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('notification_token');
    if (token != null) {
      if (installation.objectId == null) {
        installation.deviceToken = token;
        installation.create();
      } else if (installation.deviceToken != token) {
        installation.deviceToken = token;
        installation.save();
      }
    }
  }
}
