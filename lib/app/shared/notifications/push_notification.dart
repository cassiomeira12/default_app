import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:platform_info/platform_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase/firebase_push_notification.dart';
import '../models/user.dart';
import '../repositories/auth_service.dart';
import '../repositories/parse/parse_user_service.dart';

class PushNotification {
  var auth = Get.find<AuthService>();
  var service = ParseUserService();

  FirebasePushNotifications pushNotifications;

  PushNotification() {
    if (Platform.I.isIO) {
      if (Platform.I.isAndroid || Platform.I.isIOS || Platform.I.isMacOS) {
        pushNotifications = FirebasePushNotifications();
      }
    }
    updateNotificationToken();
  }

  updateNotificationToken() async {
    if (pushNotifications == null) return;
    var pref = await SharedPreferences.getInstance();
    String currentToken = pref.getString("notification_token");
    var user = await auth.currentUser();
    if (user != null) {
      var userToken = user.notificationToken;
      if (userToken == null ||
          userToken.token == null ||
          userToken.token != currentToken) {
        if (userToken == null) {
          userToken = NotificationToken(currentToken);
        } else {
          userToken.token = currentToken;
        }
        user.notificationToken = userToken;
        await service.update(user.toMap());
        pushNotifications.subscribeDefaultTopics();
      }
    }
  }
}
