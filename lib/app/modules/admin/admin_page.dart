import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var auth = Get.put(AuthService());

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      var result = await auth.currentUser();
      Get.offNamed(result == null ? '/admin/login' : '/admin/dashboard');
    } catch (error) {
      Get.offNamed('/admin/login');
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
