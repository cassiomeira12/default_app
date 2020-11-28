import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:flutter/material.dart';

import 'company_controller.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  var controller = CompanyController();

  void showDialogLogOut() async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: "SIGNOUT",
      okLabel: "SIGNOUT",
      cancelLabel: "CANCELAR",
      message: "Deseja sair do APP_NAME ?",
    );
    switch (result) {
      case OkCancelResult.ok:
//        setState(() => _loading = true);
//        presenter.signOut().then((value) {
//          widget.logoutCallback();
//        }).catchError((error) {
//          setState(() => _loading = false);
//          ScaffoldSnackBar.failure(context, _scaffoldKey, SOME_ERROR);
//        });
        break;
      case OkCancelResult.cancel:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            children: [
//              Container(
//                margin: EdgeInsets.all(20),
//                child: CustomFutureBuilder(
//                  future: controller.list(),
//                  builder: (context, data) {
//                    return CustomCard();
//                  },
//                ),
//              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 250,
                color: Colors.pink,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 250,
                color: Colors.grey,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
