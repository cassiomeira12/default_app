import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/strings/strings.dart';

class ParseInit extends GetxController {
  static Parse parse;

  static Future<Parse> init() async {
    parse = await Parse().initialize(
      GlobalConfiguration().appConfig['APP_ID'],
      GlobalConfiguration().appConfig['SERVER_URL'],
      appName: APP_NAME,
      liveQueryUrl: GlobalConfiguration().appConfig['SERVER_URL'],
      clientKey: GlobalConfiguration().appConfig['CLIENT_KEY'],
      autoSendSessionId: true,
      debug: kDebugMode,
    );
    _initInstallation();
    parse.healthCheck();
    return parse;
  }

  static Future _initInstallation() async {
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
