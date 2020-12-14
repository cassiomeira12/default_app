import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/admin/dashboard/components/order_widget/order_widget.dart';
import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:flutter/material.dart';

class VersionAppPage extends StatefulWidget {
  @override
  _VersionAppPageState createState() => _VersionAppPageState();
}

class _VersionAppPageState extends State<VersionAppPage> {
  bool createNew = false;

  dynamic data = {
    "fields": [
      {
        "field": "name",
        "initial": "cassio",
        "type": "textField",
        "title": "Nome",
      },
      {
        "field": "currentCode",
        "type": "textField",
        "title": "Versão atual",
      },
      {
        "field": "minimumCode",
        "type": "textField",
        "title": "Versão mínima",
      },
      {
        "field": "notification",
        "type": "textArea",
        "title": "Notificação",
      },
      {
        "field": "storeUrl",
        "type": "textField",
        "title": "URL na Loja",
      },
      {
        "field": "packageName",
        "type": "textField",
        "title": "Package",
      },
      {
        "field": "platform",
        "type": "textField",
        "title": "Plataforma",
      },
      {
        "type": "button",
        "title": "Salvar",
        "validateRequired": false,
        "action": (data2) {
          print("Result");
          print(data2);
        },
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PrimaryButton(
            text: "Adicionar",
            onPressed: () {
              setState(() {
                createNew = !createNew;
              });
            },
          ),
          CardPage(
            child: createNew
                ? GenerateForm(
                    data: data,
                  )
                : Column(
                    children: [
                      OrderWidget(),
                      OrderWidget(),
                      OrderWidget(),
                      OrderWidget(),
                      OrderWidget(),
                      OrderWidget(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
