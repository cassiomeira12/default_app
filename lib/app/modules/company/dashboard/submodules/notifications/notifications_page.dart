import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:default_app/app/modules/company/dashboard/submodules/notifications/notifications_controller.dart';
import 'package:default_app/app/shared/models/company/company.dart';
import 'package:default_app/app/shared/repositories/admin_company_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var controller = NotificationController();

  final _formKey = GlobalKey<FormState>();

  dynamic form;

  Company company;

  @override
  void initState() {
    super.initState();
    company = Get.find<AdminCompanyService>().company;
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
              "value": company.topic,
            },
            {
              "title": "Todos clientes",
              "value": kIsWeb
                  ? "com.navan.kideliver-android"
                  : "com.navan.kideliver-android",
            }
          ],
        },
        {
          "type": "button",
          "title": "Testar notificação",
          "validateRequired": true,
          "alignment": Alignment.center,
          "action": (data) {
            print("Result");
          },
        },
        {
          "type": "button",
          "title": "Salvar",
          "validateRequired": true,
          "alignment": Alignment.center,
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
                GenerateForm(data: form),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
