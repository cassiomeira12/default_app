import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/components/text_input/area_input_field.dart';
import 'package:default_app/app/components/text_input/text_input_field.dart';
import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Contato",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextInputField(
                      labelText: "Nome",
                      keyboardType: TextInputType.emailAddress,
                      //onSaved: (value) => _email = value.trim(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextInputField(
                      labelText: "Telefone",
                      keyboardType: TextInputType.emailAddress,
                      //onSaved: (value) => _email = value.trim(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextInputField(
                      labelText: "Assunto",
                      keyboardType: TextInputType.emailAddress,
                      //onSaved: (value) => _email = value.trim(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: AreaInputField(
                      labelText: "Menssagem",
                      maxLines: 5,
                      //onSaved: (value) => _email = value.trim(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: PrimaryButton(
                      text: "Enviar Mensagem",
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          CopyRigth(),
        ],
      ),
    );
  }
}
