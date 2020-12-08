import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  dynamic form = {
    "fields": [
      {
        "field": "title",
        "type": "textField",
        "title": "Título",
      },
      {
        "field": "message",
        "type": "textArea",
        "title": "Mensagem",
      },
      {
        "field": "topic",
        "type": "spinner",
        "title": "Tópico",
        "message": "Escolha uma opção",
        "values": [
          {
            "title": "Meus clientes",
            "value": "teste",
          },
          {
            "title": "Todos clientes",
            "value": "com.navan.kideliver-android",
          }
        ],
      },
      {
        "type": "button",
        "title": "Testar notificação",
        "validateRequired": false,
        "action": (data2) {
          print("Result");
          print(data2);
        },
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
          CardPage(
            child: GenerateForm(
              data: form,
            ),
          ),
        ],
      ),
    );
  }
}
