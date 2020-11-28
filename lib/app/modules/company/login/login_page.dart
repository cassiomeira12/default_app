import 'package:default_app/app/components/buttons/light_button.dart';
import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/buttons/secondary_button.dart';
import 'package:default_app/app/components/shapes/background_card.dart';
import 'package:default_app/app/components/shapes/shape_round.dart';
import 'package:default_app/app/components/text_input/text_input_field.dart';
import 'package:default_app/app/modules/company/dashboard/dashboard_page.dart';
import 'package:default_app/app/modules/company/login/login_controller.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  //LoginContractPresenter loginPresenter;
  //UserContractPresenter userPresenter;

  var controller = LoginController();

  String _email;
  String _password;

  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
//    loginPresenter = LoginPresenter(this);
//    userPresenter = UserPresenter(null);
//    if (Singletons.user().id != null) {
//      controller.text = Singletons.user().email;
//    }
  }

  @override
  void dispose() {
    super.dispose();
//    loginPresenter.dispose();
//    userPresenter.dispose();
  }

  @override
  hideProgress() {
    setState(() => _loading = false);
  }

  @override
  showProgress() {
    setState(() => _loading = true);
  }

  @override
  onFailure(String error) {
    hideProgress();
    //ScaffoldSnackBar.failure(context, _scaffoldKey, error);
  }

//  @override
//  onSuccess(BaseUser result) async {
//    Singletons.user().updateData(result);
//    if (result.emailVerified) {
//      if (result.phoneNumber == null && !result.isAnonymous()) {
//        var phoneNumber = await PageRouter.push(
//            context,
//            PhoneNumberPage(
//              authenticate: false,
//            ));
//        Singletons.user().phoneNumber = phoneNumber;
//      }
//    }
//    if (widget.anonymousLogin) {
//      await updateNotificationToken();
//      PageRouter.pop(context);
//    } else {
//      widget.loginCallback();
//    }
//  }

//  Future<void> updateNotificationToken() async {
//    var notificationToken =
//        await Singletons.pushNotification().updateNotificationToken();
//    Singletons.user().notificationToken = notificationToken;
//    PreferencesUtil.setUserData(Singletons.user().toMap());
//    userPresenter.update(Singletons.user());
//    return;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        progressIndicator: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
        ),
        child: keyboardDismisser(),
      ),
    );
  }

  Widget keyboardDismisser() {
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onVerticalDragDown],
      child: body(),
    );
  }

  Widget body() {
    return Stack(
      children: <Widget>[
        BackgroundCard(),
        bodyAppScrollView(),
      ],
    );
  }

  Widget bodyAppScrollView() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShapeRound(child: _showForm()),
            Text("--- OU ---", style: Theme.of(context).textTheme.body2),
            //googleButton(),
            signupButton(),
            //anonymousButton(),
            newCompanyButton(),
          ],
        ),
      ),
    );
  }

  Widget _showForm() {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showForgotPasswordButton(),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget showLogo() {
    return Column(
      children: <Widget>[
        Hero(
          tag: APP_NAME,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 58.0,
              child: Image.asset("images/logo_app.png"),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          APP_NAME,
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: TextInputField(
        labelText: EMAIL,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: TextInputField(
        labelText: PASSWORD,
        keyboardType: TextInputType.text,
        obscureText: true,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showForgotPasswordButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: LightButton(
        alignment: Alignment.bottomRight,
        text: RECOVER_PASSWORD,
        onPressed: () {
          //PageRouter.push(context, ForgotPasswordPage());
        },
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: PrimaryButton(
        text: LOGIN,
        onPressed: validateAndSubmit,
      ),
    );
  }

//  Widget googleButton() {
//    return Padding(
//      padding: EdgeInsets.fromLTRB(60, 12, 60, 0),
//      child: SecondaryButton(
//        child: Row(
//          children: <Widget>[
//            Flexible(
//              child: Align(
//                alignment: Alignment.centerLeft,
//                child: Image.asset(
//                  "assets/images/google_logo.png",
//                  width: 25,
//                ),
//              ),
//            ),
//            Flexible(
//              flex: 5,
//              child: Container(
//                alignment: Alignment.center,
//                child: AutoSizeText(
//                  LOGAR_COM_GOOGLE,
//                  maxLines: 1,
//                  textAlign: TextAlign.center,
//                  style: Theme.of(context).textTheme.body2,
//                ),
//              ),
//            ),
//            Expanded(
//              child: Container(),
//            ),
//          ],
//        ),
//        onPressed: () {
//          loginPresenter.signInWithGoogle();
//        },
//      ),
//    );
//  }

  Widget signupButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, 12, 60, 10),
      child: SecondaryButton(
        text: CREATE_ACCOUNT,
        onPressed: () {
//          PageRouter.push(
//              context,
//              SignUpPage(
//                loginCallback: widget.loginCallback,
//              ));
        },
      ),
    );
  }

  Widget anonymousButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
      child: LightButton(
        text: "Entrar como convidado".toUpperCase(),
        onPressed: () {
          //loginPresenter.signAnonymous();
        },
      ),
    );
  }

  Widget newCompanyButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
      child: LightButton(
        text: "Cadastre seu estabelecimento".toUpperCase(),
        onPressed: () {
          //Get.to(NewCompanyPage());
          //PageRouter.push(context, NewCompanyPage());
        },
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() {
    _email = "cassiomeirasilva12@gmail.com";
    _password = "123456";
    if (!validateAndSave()) {
      parseLogin(_email, _password);
    }
  }

  void parseLogin(email, password) async {
    try {
      setState(() => _loading = true);
      var result = await controller.signIn(email, password);
      print(result);
      Get.to(DashboardPage());
    } catch (error) {
      print(error);
    } finally {
      setState(() => _loading = false);
    }
  }
}