import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/shapes/background_card.dart';
import 'package:default_app/app/components/shapes/shape_round.dart';
import 'package:default_app/app/components/text_input/text_input_field.dart';
import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:default_app/app/styles/font_style.dart';
import 'package:default_app/app/utils/strings/errors.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordPage extends StatefulWidget {
  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  bool _isLoading = false;

  var auth = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(child: body()),
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
        ],
      ),
    );
  }

  Widget _showForm() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            textTitle(),
            emailInput(),
            textMensagem(),
            _isLoading ? showCircularProgress() : sendButton()
          ],
        ),
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        RECOVER_PASSWORD,
        style: fontTitle(context),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: TextInputField(
        labelText: EMAIL,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget textMensagem() {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Center(
        child: Text(
          FORGOT_PASSWORD_TEXT,
          textAlign: TextAlign.center,
          style: fontSubtitle(context, size: 20),
        ),
      ),
    );
  }

  Widget showCircularProgress() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
      child: CircularProgressIndicator(),
    );
  }

  Widget sendButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: PrimaryButton(
        text: RECOVER_PASSWORD,
        onPressed: () {
          if (validateAndSave()) {
            setState(() => _isLoading = true);
            auth.sendPasswordReset(_email).then((value) {
              Get.showSnackbar(GetBar(
                message: value ? EMAIL_SEND_SUCCESSFUL : SOME_ERROR,
                backgroundColor: value ? Colors.green : Colors.red,
                duration: Duration(seconds: 5),
              ));
            }).whenComplete(() => setState(() => _isLoading = false));
          }
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
