import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/admin/dashboard/components/version_app/version_app_widget.dart';
import 'package:default_app/app/modules/admin/dashboard/dashboard_controller.dart';
import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:default_app/app/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VersionAppPage extends StatefulWidget {
  @override
  _VersionAppPageState createState() => _VersionAppPageState();
}

class _VersionAppPageState extends State<VersionAppPage> {
  bool createNewItem = false, updateItem = false;

  final controller = Get.put(DashBoardController());

  dynamic newData;
  dynamic data;

  @override
  void initState() {
    super.initState();
    newData = {
      "fields": [
        {
          "field": "name",
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
          "field": "notificationTitle",
          "type": "textField",
          "title": "Título notificação",
        },
        {
          "field": "notificationBody",
          "type": "textArea",
          "title": "Mensagem notificação",
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
          "action": (Map<String, dynamic> result) async {
            var notification = {
              'title': result['notificationTitle'],
              'body': result['notificationBody'],
            };

            result['notification'] = notification;

            result.remove('notificationTitle');
            result.remove('notificationBody');

            print(result);

            setState(() {
              createNewItem = false;
            });
          },
        }
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Cadastrar",
                        style: fontTitle(context),
                      ),
                      PrimaryButton(
                        text: createNewItem || updateItem
                            ? "Cancelar"
                            : "Adicionar",
                        onPressed: () {
                          setState(() {
                            if (createNewItem) {
                              createNewItem = false;
                            } else if (updateItem) {
                              updateItem = false;
                            } else {
                              createNewItem = true;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                createNewItem || updateItem
                    ? createNewItem
                        ? GenerateForm(data: newData)
                        : GenerateForm(data: data)
                    : CustomFutureBuilder(
                        future: controller.listVersionApps(),
                        builder: (context, snapshot) {
                          List list = List.from(snapshot.data);
                          return Column(
                            children: list.map((e) {
                              return InkWell(
                                child: VersionAppWidget(data: e),
                                onTap: () {
                                  setData(e);
                                  setState(() {
                                    updateItem = true;
                                  });
                                },
                              );
                            }).toList(),
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setData(data) {
    this.data = {
      "fields": [
        {
          "field": "name",
          "initial": data['name'],
          "type": "textField",
          "title": "Nome",
        },
        {
          "field": "currentCode",
          "initial": data['currentCode'],
          "type": "textField",
          "textInputType": TextInputType.number,
          "title": "Versão atual",
        },
        {
          "field": "minimumCode",
          "initial": data['minimumCode'],
          "type": "textField",
          "textInputType": TextInputType.number,
          "title": "Versão mínima",
        },
        {
          "field": "notificationTitle",
          "initial": data['notification']['title'],
          "type": "textField",
          "title": "Título notificação",
        },
        {
          "field": "notificationBody",
          "initial": data['notification']['body'],
          "type": "textArea",
          "title": "Mensagem notificação",
        },
        {
          "field": "storeUrl",
          "initial": data['storeUrl'],
          "type": "textField",
          "enable": false,
          "title": "URL na Loja",
        },
        {
          "field": "packageName",
          "initial": data['packageName'],
          "type": "textField",
          "enable": false,
          "title": "Package",
        },
        {
          "field": "platform",
          "initial": data['platform'],
          "type": "textField",
          "enable": false,
          "title": "Plataforma",
        },
        {
          'type': 'button',
          "title": "Cancelar",
          "validateRequired": false,
          "action": (result) {
            setState(() {
              updateItem = false;
            });
          }
        },
        {
          "type": "button",
          "title": "Salvar",
          "validateRequired": false,
          "action": (Map<String, dynamic> result) async {
            result['objectId'] = data['objectId'];

            var notification = {
              'title': result['notificationTitle'],
              'body': result['notificationBody'],
            };

            result['notification'] = notification;

            result.remove('notificationTitle');
            result.remove('notificationBody');

            await controller.updateVersionApp(result);

            setState(() {
              updateItem = false;
            });
          },
        }
      ]
    };
  }
}
