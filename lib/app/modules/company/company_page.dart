import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/notifications/push_notification.dart';
import '../../shared/repositories/admin_company_service.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  var admin = Get.put(AdminCompanyService());
  var pushNotification = PushNotification();

  @override
  void initState() {
    super.initState();
    pushNotification.updateNotificationToken();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    try {
      await admin.currentAdminUser();
      Get.offNamed(admin.isAdmin() ? '/company/dashboard' : '/company/login');
    } catch (error) {
      Get.offNamed('/company/login');
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
