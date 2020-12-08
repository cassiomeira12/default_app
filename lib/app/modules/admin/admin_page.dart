import 'package:default_app/app/modules/admin/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard/dashboard_page.dart';
import 'login/login_page.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var controller = AdminController();

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      var result = await controller.currentUser();
      Get.off(result == null ? LoginPage() : DashboardPage());
    } catch (error) {
      Get.off(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: Image.asset("assets/images/logo_app.png"),
                  ),
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
