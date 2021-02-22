import 'package:default_app/app/modules/company/dashboard/components/order_widget/order_widget.dart';
import 'package:default_app/app/modules/company/dashboard/submodules/orders/order_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
//          Container(
//            width: MediaQuery.of(context).size.width / 1.5,
//            height: 500,
//            child: Card(
//              elevation: 5,
//              child: Container(),
//            ),
//          ),
          GestureDetector(
            child: OrderWidget(),
            onTap: () {
              Get.to(OrderDetailsPage());
            },
          ),
          OrderWidget(),
          OrderWidget(),
          OrderWidget(),
          OrderWidget(),
          OrderWidget(),
          OrderWidget(),
        ],
      ),
    );
  }
}
