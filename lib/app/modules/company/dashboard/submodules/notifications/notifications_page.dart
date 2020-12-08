import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/buttons/secondary_button.dart';
import 'package:default_app/app/components/text_input/area_input_field.dart';
import 'package:default_app/app/components/text_input/text_input_field.dart';
import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:default_app/app/modules/company/dashboard/submodules/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var controller = NotificationController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardPage(
            child: Column(
              children: [
                formPushNotification(),
                topic(),
                testButton(),
                sendButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget formPushNotification() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textTitleWidget(),
          textMessageWidget(),
        ],
      ),
    );
  }

  Widget textTitleWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Center(
        child: TextInputField(
          labelText: "Título",
          //enable: false,
          //controller: titleController,
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    );
  }

  Widget textMessageWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Center(
        child: AreaInputField(
          labelText: "Mensagem",
          maxLines: 5,
          //onChanged: (value) => message = value,
        ),
      ),
    );
  }

  Widget topic() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          elevation: 2,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //FaIcon(FontAwesomeIcons.searchLocation, color: Colors.grey,),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "aF", //topicSelected["label"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FaIcon(
                FontAwesomeIcons.caretDown,
                color: Colors.grey[400],
              ),
            ],
          ),
          onPressed: () async {
            // String topicSelected = await showConfirmationDialog<String>(
            //   context: context,
            //   title: "Escolha um tópico",
            //   okLabel: "Ok",
            //   cancelLabel: "CANCELAR",
            //   barrierDismissible: false,
            //   actions: topics.values.map((e) {
            //     return AlertDialogAction<String>(
            //         label: e["label"], key: e["key"]);
            //   }).toList(),
            // );
            // if (topicSelected != null) {
            //   setState(() {
            //     this.topicSelected = topics[topicSelected];
            //   });
            // }
          },
        ),
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

  Widget testButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: SecondaryButton(
        text: "Testar nesse celular",
        onPressed: () {
          // if (validateAndSave()) {
          //   Singletons.pushNotification().pushLocalNotification(
          //     titleController.text,
          //     message,
          //   );
          // }
        },
      ),
    );
  }

  Widget sendButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 50),
      child: PrimaryButton(
        text: "Enviar notificação",
        onPressed: () {
          if (validateAndSave()) {
            // var pushNotification = PushNotification();
            // pushNotification.title = titleController.text;
            // pushNotification.message = message;
            // pushNotification.senderCompany = Singletons.company();
            // pushNotification.senderUser = Singletons.user();
            // pushNotification.topic = topicSelected["key"];
            //
            // setState(() => _loading = true);
            // presenter.create(pushNotification);
          }
        },
      ),
    );
  }
}
