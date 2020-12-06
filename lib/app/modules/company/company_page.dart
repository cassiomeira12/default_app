import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'company_controller.dart';
import 'dashboard/dashboard_page.dart';
import 'login/login_page.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  var controller = CompanyController();

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    await Future.delayed(Duration(seconds: 2));
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
                    child: Image.asset("images/logo_app.png"),
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
