import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../../../components/buttons/secondary_button.dart';
import '../../../../../components/generate_form/generate_form.dart';
import '../../../../../components/shapes/background_card.dart';
import '../../../../../components/shapes/shape_round.dart';
import '../../../../../styles/font_style.dart';
import '../../../../../utils/strings/errors.dart';
import '../../../../../utils/strings/strings.dart';
import 'create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _loading = false;

  String _password;

  dynamic formData;

  var controller = CreateAccountController();

  @override
  void initState() {
    super.initState();
    formData = {
      "fields": [
        {
          "field": "name",
          "title": "Nome",
          "type": "textField",
        },
        {
          "field": "email",
          "title": "Email",
          "type": "textField",
          "textInputType": TextInputType.emailAddress,
        },
        {
          "field": "cpf",
          "title": "CPF",
          "type": "textField",
          "controller": MaskedTextController(mask: '000.000.000-00'),
          "textInputType": TextInputType.number,
        },
        {
          "field": "phoneNumber",
          "title": "Telefone",
          "type": "textField",
          "controller": MaskedTextController(mask: '+55 00 0 00000000'),
          "textInputType": TextInputType.number,
          "validator": (String value) {
            if (value.isEmpty || value.length < 17) {
              return "Digite seu telefone";
            }
            return null;
          },
        },
        {
          "field": "password",
          "title": "Senha",
          "obscureText": true,
          "type": "textField",
          "validator": (value) {
            if (value.isEmpty || value.length < 6) {
              return SHORT_PASSWORD;
            }
            _password = value;
            return null;
          },
        },
        {
          "title": "Repita a senha",
          "obscureText": true,
          "type": "textField",
          "validator": (value) {
            if (value.isEmpty || value.length < 6) {
              return SHORT_PASSWORD;
            }
            if (_password != value) {
              return PASSWORD_NOT_EQUAL;
            }
            return null;
          },
        },
        {
          "field": "terms",
          "title": "Concordo com os termos de uso",
          "type": "checkbox",
          "initial": false,
        },
        {
          "type": "button",
          "title": CREATE_ACCOUNT,
          "validateRequired": true,
          "action": (Map<String, dynamic> data) {
            if (data['terms']) {
              data.remove('terms');
              data['username'] = data['email'];
              data['phoneNumber'] =
                  data['phoneNumber'].toString().replaceAll(' ', '');
              createUser(data);
            }
          },
        }
      ]
    };
  }

  void createUser(data) async {
    setState(() => _loading = true);
    controller.createAccount(data).then((value) {
      Get.offAllNamed('/client');
    }).catchError((error) {
      catchError(error: error);
    }).whenComplete(() => setState(() => _loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
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
        child: SingleChildScrollView(child: body()),
      ),
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
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          textTitle(),
          GenerateForm(data: formData),
        ],
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        CREATE_ACCOUNT,
        style: fontTitle(context),
      ),
    );
  }

  Widget textData() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          "TEXT_DADOS",
          textAlign: TextAlign.center,
          style: fontSubtitle(context),
        ),
      ),
    );
  }

  Widget textOU() {
    return Text(
      "--- OU ---",
      style: Theme.of(context).textTheme.body2,
    );
  }

  Widget googleButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, 12, 60, 20),
      child: SecondaryButton(
        child: Row(
          children: <Widget>[
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/google_logo.png",
                  width: 25,
                ),
              ),
            ),
            // Flexible(
            //   flex: 5,
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: AutoSizeText(
            //       USE_GOOGLE_ACCOUNT,
            //       maxLines: 1,
            //       textAlign: TextAlign.center,
            //       style: Theme.of(context).textTheme.body2,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        onPressed: () {
          //presenter.signInWithGoogle();
        },
      ),
    );
  }
}
