import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool createNewItem = false, updateItem = false;

  dynamic form;

  @override
  void initState() {
    super.initState();
    form = {
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
            },
            {
              "title": "Todos usuários",
              "value": "ALL",
            }
          ],
        },
        {
          "type": "button",
          "title": "Testar notificação",
          "validateRequired": false,
          "action": (data) {
            print("Result");
          },
        },
        {
          "type": "button",
          "title": "Salvar",
          "validateRequired": true,
          "action": (data) {
            print("Result");
            print(data);
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nova notificação",
                        style: fontTitle(context),
                      ),
                      // PrimaryButton(
                      //   text: createNewItem || updateItem
                      //       ? "Cancelar"
                      //       : "Adicionar",
                      //   onPressed: () {
                      //     setState(() {
                      //       if (createNewItem) {
                      //         createNewItem = false;
                      //       } else if (updateItem) {
                      //         updateItem = false;
                      //       } else {
                      //         createNewItem = true;
                      //       }
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
                GenerateForm(
                  data: form,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
