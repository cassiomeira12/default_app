import 'package:default_app/app/components/image_network/image_network_widget.dart';
import 'package:default_app/app/components/shapes/shape_round.dart';
import 'package:default_app/app/components/text_input/text_input_field.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShapeRound(
            child: Column(
              children: [
                Container(
                  width: 180,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        child: Center(
                          child: ImageNetworkWidget(
                            url: null,
                            size: 160,
                          ),
                        ),
                        onTap: () async {
                          // FilePickerResult result =
                          //     await FilePicker.platform.pickFiles();
                          //
                          // if (result != null) {
                          //   File file = File(result.files.single.path);
                          //   print(result.files.single.path);
                          //   print(file);
                          // } else {
                          //   // User canceled the picker
                          // }
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RawMaterialButton(
                          child: Icon(Icons.camera_alt, color: Colors.white),
                          shape: CircleBorder(),
                          elevation: 2,
                          fillColor: Theme.of(context).primaryColorDark,
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            //changeImgUser();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: TextInputField(
                    labelText: "EMAIL",
                    keyboardType: TextInputType.emailAddress,
                    //onSaved: (value) => _email = value.trim(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: TextInputField(
                    labelText: "EMAIL",
                    keyboardType: TextInputType.emailAddress,
                    //onSaved: (value) => _email = value.trim(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: TextInputField(
                    labelText: "EMAIL",
                    keyboardType: TextInputType.emailAddress,
                    //onSaved: (value) => _email = value.trim(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
