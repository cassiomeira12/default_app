import 'package:default_app/app/modules/company/dashboard/components/card_page/card_page.dart';
import 'package:flutter/material.dart';

class PaymentTypesPage extends StatefulWidget {
  @override
  _PaymentTypesPageState createState() => _PaymentTypesPageState();
}

class _PaymentTypesPageState extends State<PaymentTypesPage> {
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
