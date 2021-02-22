import 'package:default_app/app/components/buttons/light_button.dart';
import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/buttons/secondary_button.dart';
import 'package:default_app/app/components/shapes/background_card.dart';
import 'package:default_app/app/components/shapes/shape_round.dart';
import 'package:default_app/app/components/text_input/text_input_field.dart';
import 'package:default_app/app/shared/repositories/admin_service.dart';
import 'package:default_app/app/styles/font_style.dart';
import 'package:default_app/app/utils/strings/errors.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_signin_buttons/social_signin_buttons.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  var controller = LoginController();

  var admin = Get.put(AdminService());

  String _email, _password;
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    await admin.currentAdminUser();
    if (admin.isAdmin()) {
      Get.offNamed('/admin/dashboard');
    }
  }

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
      child: SingleChildScrollView(child: body()),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShapeRound(child: _showForm()),
          othersSignIns(),
          SizedBox(height: 100),
        ],
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: TextInputField(
                labelText: EMAIL,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value.trim(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: TextInputField(
                labelText: PASSWORD,
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (value) => _password = value.trim(),
              ),
            ),
            showForgotPasswordButton(),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget othersSignIns() {
    return Column(
      children: [
        Text("--- OU ---", style: fontMessage(context)),
        googleButton(),
        signupButton(),
        anonymousButton(),
        newCompanyButton(),
      ],
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
              radius: 100,
              child: Image.asset("assets/images/logo_app.png"),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("$APP_NAME Admin", style: fontTitle(context)),
      ],
    );
  }

  Widget showForgotPasswordButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: LightButton(
        alignment: Alignment.bottomRight,
        text: RECOVER_PASSWORD,
        onPressed: () => Get.toNamed('/recover_password'),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: PrimaryButton(
        text: LOGIN,
        onPressed: () async {
          if (validateAndSave()) {
            try {
              setState(() => _loading = true);
              await controller.signIn(_email, _password);
              Get.offNamed('/admin/dashboard');
            } catch (error) {
              catchError(title: 'Erro ao fazer login', error: error);
            } finally {
              setState(() => _loading = false);
            }
          }
        },
      ),
    );
  }

  Widget googleButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, 12, 60, 0),
      child: SignInButton(
        Buttons.Google,
        text: "Login com o Google",
        onPressed: () async {
          try {
            setState(() => _loading = true);
            await controller.signInWithGoogle();
            Get.offNamed('/admin/dashboard');
          } catch (error) {
            catchError(title: 'Erro ao fazer login', error: error);
          } finally {
            setState(() => _loading = false);
          }
        },
      ),
    );
  }

  Widget anonymousButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
      child: LightButton(
        text: "Entrar como convidado".toUpperCase(),
        onPressed: () async {
          try {
            setState(() => _loading = true);
            await controller.signAnonymous();
            Get.offNamed('/admin/dashboard');
          } catch (error) {
            catchError(title: 'Erro ao fazer login', error: error);
          } finally {
            setState(() => _loading = false);
          }
        },
      ),
    );
  }

  Widget signupButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, 12, 60, 10),
      child: SecondaryButton(
        text: CREATE_ACCOUNT,
        onPressed: () {
          //
        },
      ),
    );
  }

  Widget newCompanyButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
      child: LightButton(
        text: "Cadastre seu estabelecimento".toUpperCase(),
        onPressed: () {
          //
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
}
