import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:flutter/material.dart';

class PhoneContactPage extends StatefulWidget {
  @override
  _PhoneContactPageState createState() => _PhoneContactPageState();
}

class _PhoneContactPageState extends State<PhoneContactPage> {
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
