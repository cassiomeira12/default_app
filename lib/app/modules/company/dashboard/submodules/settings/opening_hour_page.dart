import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:flutter/material.dart';

class OpeningHourPage extends StatefulWidget {
  @override
  _OpeningHourPageState createState() => _OpeningHourPageState();
}

class _OpeningHourPageState extends State<OpeningHourPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardPage(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
