import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParseUserService {
  currentUser() async {
    ParseUser currentUser = await ParseUser.currentUser();
    if (currentUser == null) {
      return null;
    } else {
      return currentUser.toJson();
//      var userData = await PreferencesUtil.getUserData();
//      var user = BaseUser.fromMap(userData);
//      if (!user.isAnonymous() &&
//          (!user.emailVerified ||
//              user.notificationToken == null ||
//              user.phoneNumber == null)) {
//        return read(BaseUser(id: currentUser.objectId)).then((value) {
//          return value;
//        }).catchError((error) async {
//          return user;
//        });
//      } else {
//        return user;
//      }
    }
  }

  signOut() async {
    //PreferencesUtil.setUserData(null);
    ParseUser currentUser = await ParseUser.currentUser();
    await currentUser.logout();
  }

  isEmailVerified() async {
    ParseUser currentUser = await ParseUser.currentUser();
    return currentUser.emailVerified;
  }

  sendEmailVerification() async {
    ParseUser currentUser = await ParseUser.currentUser();
    return await currentUser.verificationEmailRequest().then((response) {
      return response.success ? null : throw Exception(response.error.message);
    }).catchError((error) {
      throw error;
//      switch (error.code) {
//        case -1:
//          throw Exception(ERROR_NETWORK);
//          break;
//        default:
//          throw Exception(error.message);
//      }
    });
  }
}
