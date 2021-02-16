import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseLoginService {
  @override
  signIn(String email, String password) async {
    var user = ParseUser(email, password, email);
    return user.login().then((value) async {
      if (value.success) {
        return value.result.toJson();
      } else {
        throw value.error;
      }
    }).catchError((error) {
      throw error;
    });
  }

  @override
  signInWithGoogle() async {
    String clientIDGoogle =
        "604408739135-8f0o4br2ebvs1uju3h7oq02ofnmbh1c3.apps.googleusercontent.com";
    GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: clientIDGoogle,
      //scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
    GoogleSignInAccount googleSignInAccount;
    GoogleSignInAuthentication authentication;
    AuthCredential credential;
    try {
      googleSignInAccount = await googleSignIn.signIn();
      authentication = await googleSignInAccount.authentication;
      credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );
    } catch (error) {
      print(error);
      throw error;
    } finally {
      googleSignIn.signOut();
    }

    String token = authentication.idToken;
    String id = googleSignIn.currentUser.id;
    String idToken = authentication.idToken;

    String email = googleSignInAccount.email;
    String name = googleSignInAccount.displayName;
    String avatarURL = googleSignInAccount.photoUrl;

    var authData = google(token, id, idToken);

    return ParseUser.loginWith('google', authData).then((value) async {
      if (value.success && value.statusCode == 201) {
        var user = value.result as ParseUser;
        user.username = email;
        user.set('name', name);
        user.set('avatarURL', avatarURL);
        return user.update().then((value) => value.result.toJson());
      }
      return value.result.toJson();
    }).whenComplete(() => googleSignIn.signOut());
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
