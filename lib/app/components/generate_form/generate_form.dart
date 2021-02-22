import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../buttons/primary_button.dart';
import '../text_input/area_input_field.dart';
import '../text_input/text_input_field.dart';

class GenerateForm extends StatefulWidget {
  dynamic data;

  GenerateForm({@required this.data});

  @override
  _GenerateFormState createState() => _GenerateFormState();
}

class _GenerateFormState extends State<GenerateForm> {
  final _formKey = GlobalKey<FormState>();
  final controllers = Map<String, dynamic>();
  final booleans = Map<String, bool>();
  final spinners = Map<String, dynamic>();

  dynamic data = {
    "fields": [
      {
        "field": "title",
        "initial": "cassio",
        "type": "textField",
        "title": "Teste 1",
      },
      {
        "field": "message",
        "type": "textArea",
        "title": "Teste 2",
      },
      {
        "field": "ativo",
        "type": "checkbox",
        "initial": true,
        "title": "Ativo",
      },
      {
        "field": "fechado",
        "type": "checkbox",
        "initial": false,
        "title": "Fechado",
      },
      {
        "field": "opcoes",
        "type": "spinner",
        "title": "Opções",
        "message": "Escolha uma opção",
        "values": ThemeMode.values.map((e) {
          return {"title": e.toString(), "value": e};
        }).toList(),
      },
      {
        "field": "teste",
        "type": "switch",
        "initial": true,
        "title": "Aqui",
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
  void initState() {
    super.initState();
    if (widget.data == null) {
      widget.data = data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.from(widget.data['fields']).map((e) {
            return checkType(e);
          }).toList(),
        ),
      ),
    );
  }

  Widget checkType(data) {
    switch (data['type']) {
      case "textField":
        return textField(data);
      case "textArea":
        return textArea(data);
      case "checkbox":
        return checkbox(data);
      case "button":
        return button(data);
      case "spinner":
        return spinner(data);
      case "switch":
        return switcher(data);
      default:
        return Container();
    }
  }

  Widget textField(data) {
    if (!controllers.containsKey(data['field'])) {
      if (data['controller'] == null) {
        controllers[data['field']] = data['initial'] != null
            ? TextEditingController(text: data['initial'].toString())
            : TextEditingController();
      } else {
        controllers[data['field']] = data['controller'];
      }
      data['result'] = data['initial'].toString();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextInputField(
        labelText: '${data['title']}',
        enable: data['enable'] ?? true,
        obscureText: data['obscureText'] ?? false,
        controller: controllers[data['field']],
        textCapitalization: data['textInputType'] != null &&
                data['textInputType'] == TextInputType.emailAddress
            ? TextCapitalization.none
            : data['textCapitalization'] ?? TextCapitalization.sentences,
        keyboardType: data['textInputType'],
        onChanged: (value) => data['result'] = value.trim(),
        onSaved: (value) => data['result'] = value.trim(),
        validator: data['validator'],
      ),
    );
  }

  Widget textArea(data) {
    if (!controllers.containsKey(data['field'])) {
      if (data['controller'] == null) {
        controllers[data['field']] = data['initial'] != null
            ? TextEditingController(text: data['initial'].toString())
            : TextEditingController();
      } else {
        controllers[data['field']] = data['controller'];
      }
      data['result'] = data['initial'].toString();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Center(
        child: AreaInputField(
          labelText: '${data['title']}',
          controller: controllers[data['field']],
          maxLines: data["maxLines"] ?? 5,
          enable: data['enable'] ?? true,
          keyboardType: data['textInputType'],
          onChanged: (value) => data['result'] = value.trim(),
          onSaved: (value) => data['result'] = value.trim(),
          validator: data['validator'],
        ),
      ),
    );
  }

  Widget checkbox(data) {
    if (!booleans.containsKey(data['field'])) {
      booleans[data['field']] =
          data['initial'] != null ? data['initial'] : false;
      data['result'] = data['initial'].toString();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   side: BorderSide(color: Theme.of(context).hintColor),
        // ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: booleans[data['field']],
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) {
                setState(() {
                  booleans[data['field']] = value;
                  data['result'] = value.toString();
                });
              },
            ),
            Flexible(
              child: Text(
                '${data['title']}',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        onPressed: () {
          setState(() {
            booleans[data['field']] = !booleans[data['field']];
            data['result'] = booleans[data['field']].toString();
          });
        },
      ),
    );
  }

  Widget spinner(data) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).hintColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // FaIcon(
                    //   FontAwesomeIcons.searchLocation,
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            spinners.containsKey(data['field'])
                                ? spinners[data['field']]['title']
                                : data['title'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_drop_down_outlined),
              //FaIcon(FontAwesomeIcons.caretDown),
            ],
          ),
          onPressed: () {
            showConfirmationDialog<dynamic>(
              context: context,
              title: data['message'],
              okLabel: "OK",
              cancelLabel: "CANCELAR",
              barrierDismissible: false,
              actions: List.from(data['values']).map((e) {
                return AlertDialogAction<dynamic>(
                  label: e["title"],
                  key: e,
                );
              }).toList(),
            ).then((value) {
              if (value != null) {
                setState(() {
                  spinners[data['field']] = value;
                  data['result'] = value;
                });
              }
            });
          },
        ),
      ),
    );
  }

  Widget switcher(data) {
    if (!booleans.containsKey(data['field'])) {
      booleans[data['field']] =
          data['initial'] != null ? data['initial'] : false;
      data['result'] = data['initial'].toString();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).hintColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data['title']}',
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: booleans[data['field']],
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  setState(() {
                    booleans[data['field']] = value;
                    data['result'] = value.toString();
                  });
                },
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              booleans[data['field']] = !booleans[data['field']];
              data['result'] = booleans[data['field']].toString();
            });
          },
        ),
      ),
    );
  }

  Widget button(data) {
    return Container(
      alignment: data['alignment'] ?? Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: PrimaryButton(
          text: '${data['title']}',
          onPressed: () {
            if (data['validateRequired']) {
              if (validateAndSave()) {
                data['action']?.call(generateDataResult(widget.data));
              }
            } else {
              data['action']?.call(
                generateDataResult(widget.data),
              );
            }
          },
        ),
      ),
    );
  }

  generateDataResult(data) {
    var result = Map<String, dynamic>();
    List.from(data['fields']).forEach((e) {
      if (e['field'] != null) {
        result[e['field']] = convertToInitialType(
          e['initial'],
          e['result'],
        );
      }
    });
    return result;
  }

  convertToInitialType(initial, value) {
    if (initial == null) {
      return value;
    }
    print("[$initial] -> [${initial.runtimeType}]");
    switch (initial.runtimeType) {
      case int:
        return int.parse(value);
      case double:
        return double.parse(value);
      case bool:
        return bool.fromEnvironment(value);
      default:
        return value;
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
