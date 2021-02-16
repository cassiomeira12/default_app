import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  final _notification = FlutterLocalNotificationsPlugin();

  final _channelID = "push_notification";
  final _channelName = "Notificação";
  final _channelDescription = "Notificação do aplicativo";

  final ValueChanged<dynamic> onSelectNotification;

  LocalNotification({this.onSelectNotification}) {
    //_requestPermissions();
    //_init();
  }

  _init() async {
    var settingsAndroid = _androidSettings();
    var settingsiOS = _iOSSettings();
    var settingsMacOS = _macOSSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: settingsAndroid,
      iOS: settingsiOS,
      macOS: settingsMacOS,
    );

    _notification.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  void _requestPermissions() {
    _notification
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    _notification
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  AndroidInitializationSettings _androidSettings() {
    return AndroidInitializationSettings('ic_stat_notification');
  }

  IOSInitializationSettings _iOSSettings() {
    return IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {
        return _onSelectNotification(payload);
      },
    );
  }

  MacOSInitializationSettings _macOSSettings() {
    return MacOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
  }

  Future _onSelectNotification(payload) {
    onSelectNotification?.call(payload);
  }

  int _notificationId() {
    var date = DateTime.now();
    String id = "${date.hour}${date.minute}${date.second}";
    return int.parse(id);
  }

  Future<void> showNotification({title, body, payload}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelID,
      _channelName,
      _channelDescription,
      importance: Importance.max,
      priority: Priority.max,
      enableLights: true,
      enableVibration: true,
      visibility: NotificationVisibility.public,
      ticker: 'ticker',
      playSound: true,
      styleInformation: DefaultStyleInformation(true, true),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentSound: false,
    );
    var macOSPlatformChannelSpecifics = MacOSNotificationDetails(
      presentSound: false,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
      macOS: macOSPlatformChannelSpecifics,
    );
    await _notification.show(
      _notificationId(),
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
