import 'package:default_app/app/modules/company/dashboard/submodules/history/history_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Company Orders"),
          FlatButton(
            child: Text('teste'),
            onPressed: () {
              Get.to(HistoryPage());
            },
          ),
        ],
      ),
    );
  }
}
