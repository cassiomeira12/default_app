import 'package:default_app/app/modules/company/dashboard/submodules/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var controller = NotificationController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: controller.list(),
            builder: (context, snapshot) {
              print(snapshot.data);
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
