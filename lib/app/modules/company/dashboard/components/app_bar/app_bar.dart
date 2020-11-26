import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/strings/strings.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text("Dashboard Company"),
      //leading: Container(),
      actions: [
        MaterialButton(
          child: Text(
            CLOSE,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
