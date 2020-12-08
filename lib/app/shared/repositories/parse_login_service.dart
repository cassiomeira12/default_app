import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParseLoginService {
  @override
  signIn(String email, String password) async {
    var user = ParseUser(email, password, email);
    return user.login().then((value) async {
      if (value.success) {
        var json = value.result.toJson();
        return json;
      } else {
        throw value.error;
        switch (value.error.code) {
          case -1:
            //presenter.onFailure(ERROR_NETWORK);
            break;
          case 101:
            //presenter.onFailure(ERROR_LOGIN_PASSWORD);
            break;
          default:
          //presenter.onFailure(value.error.message);
        }
      }
    }).catchError((error) {
      throw error;
      switch (error.code) {
        case -1:
          //presenter.onFailure(ERROR_NETWORK);
          break;
        case 101:
          //presenter.onFailure(ERROR_LOGIN_PASSWORD);
          break;
        default:
        //presenter.onFailure(error.message);
      }
    });
  }

  @override
  signInWithGoogle() async {
//    GoogleSignIn googleSignIn = GoogleSignIn();
//    GoogleSignInAccount googleSignInAccount;
//    GoogleSignInAuthentication googleSignInAuthentication;
//    AuthCredential credential;
//    try {
//      googleSignInAccount = await googleSignIn.signIn();
//      googleSignInAuthentication = await googleSignInAccount.authentication;
//      credential = GoogleAuthProvider.getCredential(
//        idToken: googleSignInAuthentication.idToken,
//        accessToken: googleSignInAuthentication.accessToken,
//      );
//    } catch (exception) {
//      Log.e(exception);
//      googleSignIn.signOut();
//      presenter.onFailure(SOME_ERROR);
//      return;
//    }
//
//    googleSignIn.signOut();
//
//    String email = googleSignInAccount.email;
//    String token = credential.toString();
//    String name = googleSignInAccount.displayName;
//    String avatarURL = googleSignInAccount.photoUrl;
//
//    var user = ParseUser(email, token, email);
//
//    user.login().then((value) {
//      if (value.success) {
//        var json = value.result.toJson();
//        BaseUser user = BaseUser.fromMap(json);
//        PreferencesUtil.setUserData(user.toMap());
//        presenter.onSuccess(user);
//      } else {
//        switch (value.error.code) {
//          case -1:
//            presenter.onFailure(ERROR_NETWORK);
//            break;
//          case 101:
//            createNewUser(user, name, avatarURL);
//            break;
//          default:
//            presenter.onFailure(value.error.message);
//        }
//      }
//    });
  }

  void createNewUser(ParseUser item, String name, String avatarURL) {
//    var user = ParseUser.clone(item.toJson());
//    user.set("name", name);
//    user.set("socialProvider", true);
//    user.set("avatarURL", avatarURL);
//
//    user.create().then((value) {
//      if (value.success) {
//        var json = value.result.toJson();
//        user.set("objectId", json["objectId"]);
//
//        item.login().then((value) {
//          if (value.success) {
//            BaseUser userLogin = BaseUser.fromMap(user.toJson());
//            PreferencesUtil.setUserData(userLogin.toMap());
//            presenter.onSuccess(userLogin);
//          } else {
//            Log.e(value.error);
//            switch (value.error.code) {
//              case -1:
//                presenter.onFailure(ERROR_NETWORK);
//                break;
//              default:
//                presenter.onFailure(value.error.message);
//            }
//          }
//        });
//
//      } else {
//        Log.e(value.error);
//        switch (value.error.code) {
//          case -1:
//            presenter.onFailure(ERROR_NETWORK);
//            break;
//          default:
//            presenter.onFailure(value.error.message);
//        }
//      }
//    }).catchError((error) {
//      Log.e(error);
//      switch (error.code) {
//        case -1:
//          presenter.onFailure(ERROR_NETWORK);
//          break;
//        default:
//          presenter.onFailure(error.message);
//      }
//    });
  }

  @override
  signAnonymous() async {
//    var user = ParseUser("", "", "");
//    user.loginAnonymous().then((value) async {
//      if (value.success) {
//        var json = value.result.toJson();
//        BaseUser user = BaseUser.fromMap(json);
//        user.name = "";
//        user.emailVerified = true;
//        PreferencesUtil.setUserData(user.toMap());
//        presenter.onSuccess(user);
//      } else {
//        throw value.error;
//      }
//    }).catchError((error) {
//      switch (error.code) {
//        case -1:
//          presenter.onFailure(ERROR_NETWORK);
//          break;
//        default:
//          presenter.onFailure(error.message);
//      }
//    });
  }
}
