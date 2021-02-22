import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/notifications/local_notifications.dart';

class FirebasePushNotifications {
  FirebaseMessaging _firebaseMessaging;
  LocalNotification localNotifications;

  FirebasePushNotifications() {
    localNotifications = LocalNotification(
      onSelectNotification: onSelectNotification,
    );
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessagingListeners();
  }

  void subscribeDefaultTopics({List<String> userTopics}) async {
    var topics = Topics.values.map<String>((t) {
      return t.toString().split('.').last;
    }).toList();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var package = packageInfo.packageName;
    var operatingSystem = Platform.operatingSystem;
    String packageName = "$package-$operatingSystem";
    topics.add(packageName);
    topics.addAll(userTopics ?? []);
    subscribeTopicsList(topics);
  }

  void subscribeTopicsList(List<String> topics) async {
    var pref = await SharedPreferences.getInstance();
    topics.forEach((topic) async {
      if (pref.getString(topic) == null) {
        bool value = await subscribeToTopic(topic);
        if (value) {
          pref.setString(topic, topic);
        }
      }
    });
  }

  firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) iOSPermission();

    var token = await _firebaseMessaging.getToken();
    print("TOKEN AQUI ${token}");

    var pref = await SharedPreferences.getInstance();
    pref.setString('notification_token', token);

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage ${message}");
        pushNotification(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume ${message}");
        _navigateToItemDetail(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch ${message}");
        _navigateToItemDetail(message);
      },
    );
  }

  void _navigateToItemDetail(Map<String, dynamic> message) {
    print(message);
    String payload;
    if (message.containsKey('data')) {
      var data = message['data'];
      payload = data["click_action"];
      onSelectNotification(payload);
    }
  }

  onSelectNotification(payload) {
    if (payload != null || payload.isNotEmpty) {
      print("onSelectNotification $payload");
    }
  }

  void pushNotification(Map<String, dynamic> message) {
    String title, body, payload;

    if (message.containsKey('data')) {
      var data = message['data'];
      payload = data["click_action"];
    } else {
      payload = message['click_action'];
    }
    if (message.containsKey('notification')) {
      var notification = message['notification'];
      title = notification["title"];
      body = notification["body"];
      showLocalPushNotification(title, body, payload);
    }
  }

  void showLocalPushNotification(title, body, payload) {
    localNotifications.showNotification(
      title: title,
      body: body,
      payload: payload,
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true),
    );
    // _firebaseMessaging.onIosSettingsRegistered.listen(
    //   (IosNotificationSettings settings) {
    //   },
    // );
  }

  static Future<bool> subscribeToTopic(String topic) async {
    var firebaseMessaging = FirebaseMessaging();
    return await firebaseMessaging.subscribeToTopic(topic).then((value) {
      return true;
    }).catchError((error) {
      print(error.message);
      return false;
    });
  }

  static Future<bool> unsubscribeFromTopic(String topic) async {
    var firebaseMessaging = FirebaseMessaging();
    return await firebaseMessaging.unsubscribeFromTopic(topic).then((value) {
      return true;
    }).catchError((error) {
      print(error.message);
      return false;
    });
  }
}

enum Topics {
  ALL,
}
