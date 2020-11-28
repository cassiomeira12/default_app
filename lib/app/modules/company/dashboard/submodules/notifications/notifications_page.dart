import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/buttons/secondary_button.dart';
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
          Container(
            width: MediaQuery.of(context).size.width < 990
                ? MediaQuery.of(context).size.width / 1.1
                : MediaQuery.of(context).size.width / 1.5,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height / 1.2,
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      //color: Colors.grey,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SecondaryButton(
                            text: "asdf",
                            onPressed: () {},
                          ),
                          PrimaryButton(
                            text: "Novo",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 100,
                      height: 400,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 100,
                      height: 400,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 100,
                      height: 400,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}