import 'package:default_app/app/shared/repositories/parse/parse_init.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AuthService extends GetxController {
  final authed = false.obs;
  dynamic _user;

  currentUser() async {
    await ParseInit.init();
    if (_user == null) {
      _user = await ParseUser.currentUser();
    }
    authed.value = _user != null;
    return _user;
  }

  isAuth() {
    return authed.value;
  }
}
