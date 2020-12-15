import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/admin/dashboard/components/card_page/card_page.dart';
import 'package:flutter/material.dart';

class NewCompanyPage extends StatefulWidget {
  @override
  _NewCompanyPageState createState() => _NewCompanyPageState();
}

class _NewCompanyPageState extends State<NewCompanyPage> {
  dynamic form;

  @override
  void initState() {
    super.initState();
    form = {
      "fields": [
        {
          "field": "name",
          "type": "textField",
          "title": "Nome da empresa",
        },
        {
          "field": "topic",
          "type": "textField",
          "title": "Tópico",
        },
        {
          "field": "cnpj",
          "type": "textField",
          "title": "CNPJ",
        },
        {
          "field": "logoURL",
          "type": "textField",
          "title": "Logo URL",
        },
        {
          "field": "bannerURL",
          "type": "textField",
          "title": "Banner URL",
        },
        {
          "field": "show",
          "type": "checkbox",
          "title": "Mostrar",
        },
        {
          "field": "initiated",
          "type": "checkbox",
          "title": "Inicializado",
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardPage(
            child: GenerateForm(data: form),
          ),
        ],
      ),
    );
  }
}
