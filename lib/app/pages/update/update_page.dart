//import 'package:default_app/app/components/buttons/primary_button.dart';
//import 'package:default_app/app/components/buttons/secondary_button.dart';
//import 'package:default_app/app/utils/strings/strings.dart';
//import 'package:flutter/material.dart';
//
//import 'update_controller.dart';
//
//class UpdatePage extends StatefulWidget {
//  @override
//  _UpdatePageState createState() => _UpdatePageState();
//}
//
//class _UpdatePageState extends State<UpdatePage> {
//  //final controller = UpdateController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Stack(
//            children: <Widget>[
//              //BackgroundCard(height: 200),
//              Container(
//                alignment: Alignment.center,
//                margin: EdgeInsets.only(top: 130),
//                height: 120,
//                decoration: BoxDecoration(
//                  shape: BoxShape.circle,
//                  color: Colors.white,
//                  border: Border.all(
//                    width: 1,
//                    color: Theme.of(context).hintColor,
//                  ),
//                ),
//                child: Icon(
//                  Icons.system_update,
//                  size: 100,
//                  color: Colors.lightBlue,
//                ),
//              ),
//            ],
//          ),
//          Text(
//            UPDATE_APP,
//            style: Theme.of(context).textTheme.subtitle,
//            textAlign: TextAlign.center,
//          ),
//          controller.minimumUpdate
//              ? Container()
//              : Text(
//                  VERSION_OLDER,
//                  style: Theme.of(context).textTheme.body1,
//                  textAlign: TextAlign.center,
//                ),
//          Row(
//            children: <Widget>[
//              controller.minimumUpdate
//                  ? Flexible(
//                      child: Padding(
//                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                        child: SecondaryButton(
//                            text: NOT_NOW,
//                            onPressed: () => controller.notNow()),
//                      ),
//                    )
//                  : Container(),
//              Flexible(
//                child: Padding(
//                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                  child: PrimaryButton(
//                    text: UPDATE,
//                    onPressed: () => controller.update(),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
