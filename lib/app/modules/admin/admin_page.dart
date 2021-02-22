import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/repositories/admin_service.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var admin = Get.find<AdminService>();
  //var pushNotification = PushNotification();

  @override
  void initState() {
    super.initState();
    //pushNotification.updateNotificationToken();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    try {
      await admin.currentAdminUser();
      Get.offNamed(admin.isAdmin() ? '/admin/dashboard' : '/admin/login');
    } catch (error) {
      print(error);
      Get.offNamed('/admin/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100,
                  child: Image.asset("assets/images/logo_app.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
