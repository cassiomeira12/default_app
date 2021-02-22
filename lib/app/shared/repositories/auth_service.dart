import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/user.dart';

class AuthService extends GetxController {
  final authed = false.obs;
  User _user;

  Future<User> currentUser() async {
    ParseUser parseUser = await ParseUser.currentUser();
    authed.value = parseUser != null;
    _user = parseUser == null ? null : User.fromMap(parseUser.toJson());
    return _user;
  }

  User getUser() {
    return _user;
  }

  bool isAuth() {
    return authed.value;
  }

  Future<bool> logout() async {
    if (isAuth()) {
      ParseUser parseUser = await ParseUser.currentUser();
      return parseUser.logout().then((value) => value.success);
    }
    return false;
  }

  Future<bool> sendPasswordReset(String email) async {
    return await ParseUser(null, null, email)
        .requestPasswordReset()
        .then((value) => value.success);
  }
}
