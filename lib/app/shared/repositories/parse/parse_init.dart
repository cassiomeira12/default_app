import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseInit {
//  static String appId = "123456";
//  static String serverUrl = "http://192.168.1.110:1337/parse";
//  static String masterKey = "123456";

  static String appId = "vP5eyem24FCRjqbzvfTx7KKgRN7WMk7RGObRBQfk";
  static String serverUrl =
      "https://pg-app-umn8hkxj0yfqr3tue4vyhpzr5j1zst.scalabl.cloud/1/";
  static String clientKey = "hX0GOokmRVb1nQg4gjlM0n1RpkTk7NbWRgoQgBNH";
  static String restApiKet = "6O4o1phUq74aalaJ75qqRrz3kbQgNWQORBg5kR7R";

  static Parse parse;

  static Future<bool> init() async {
    if (parse == null) {
      parse = await Parse().initialize(
        appId,
        serverUrl,
        appName: APP_NAME,
        appVersion: kIsWeb ? "web" : null,
        appPackageName: kIsWeb ? "web" : null,
        liveQueryUrl: serverUrl,
        clientKey: clientKey,
        autoSendSessionId: true,
        debug: !kDebugMode,
      );
    }
    //initInstallation();
    return parse.hasParseBeenInitialized();
  }

  // static Future<bool> isInitialize() async {
  //   return await init();
  // }

  static Future initInstallation() async {
    var installation = await ParseInstallation.currentInstallation();
    if (installation.objectId == null) {
      var result = await installation.create();
    } else {
      var result = await installation.update();
    }
    //String notificationToken = await PreferencesUtil.getNotificationToken();
    //installation.deviceToken = notificationToken;
    //await installation.create();
  }
}
