import 'package:firebase_auth/firebase_auth.dart';

class FirebaseVerifiedSMSService {
  Future verifyPhoneNumber(String phoneNumber) async {
    print(phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 5),
        verificationCompleted: (credential) async {
          FirebaseUser currentUser = FirebaseAuth.instance.currentUser;
          await currentUser.updatePhoneNumber(credential).then((value) {
            //presenter.verificationCompleted();
          }).catchError((error) {
            //presenter.verificationFailed(error.message);
          });
        },
        verificationFailed: (authException) {
          //presenter.verificationFailed(authException.message);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          //presenter.codeAutoRetrievalTimeout(verificationId);
        },
        codeSent: (verificationId, [code]) {
          //presenter.codeSent(verificationId);
        });
  }

  Future confirmSMSCode(String verificationId, String smsCode) async {
    var credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseUser currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser.phoneNumber);
    await currentUser.updatePhoneNumber(credential).then((value) {
      print(currentUser.phoneNumber);
      //presenter.verificationCompleted();
    }).catchError((error) {
      //presenter.verificationFailed(error.message);
    });
  }
}
