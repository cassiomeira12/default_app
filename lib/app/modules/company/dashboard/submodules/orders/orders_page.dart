import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/modules/company/dashboard/components/order_widget/order_widget.dart';
import 'package:default_app/app/modules/company/dashboard/submodules/orders/orders_controller.dart';
import 'package:default_app/app/shared/models/company/company.dart';
import 'package:default_app/app/shared/models/order/order.dart';
import 'package:default_app/app/shared/repositories/admin_company_service.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:default_app/app/utils/date_util.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  var controller = OrdersController();

  DateTime dateSelected = DateUtil.todayTime(0, 0);
  double totalToday = 0;

  Company company;

  @override
  void initState() {
    super.initState();
    company = Get.find<AdminCompanyService>().company;
    controller.listCompanyOrders(dateSelected).then((value) {
      calculateTotalToday(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return nestedScrollView();
  }

  Widget nestedScrollView() {
    return NestedScrollView(
      controller: ScrollController(keepScrollOffset: true),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(delegate: SliverChildListDelegate([sliverBar()])),
        ];
      },
      body: refreshBody(),
    );
  }

  Widget sliverBar() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                children: [
                  search(),
                  Text(
                    company?.getOpenTime(dateSelected),
                    style: fontSubtitle(
                      context,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    company?.getOpenCloseTime(day: dateSelected),
                    style: fontSubtitle(
                      context,
                      size: 25,
                      bold: true,
                      color: Colors.white,
                    ),
                  ),
                  // filterName != null
                  //     ? Text(
                  //   "Filtro - $filterName",
                  //   style: TextStyle(
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.bold,
                  //       color:
                  //       Theme.of(context).backgroundColor),
                  // )
                  //     : Container(),
                  Text(
                    "Total vendido hoje: R\$: ${totalToday.toStringAsFixed(2)}",
                    style: fontSubtitle(context, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget search() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.calendarAlt,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "${DateUtil.getWeekDat(dateSelected)} - ${dateSelected.day} de ${DateUtil.getMounth(dateSelected)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: dateSelected,
              firstDate: dateSelected.subtract(Duration(days: 365)),
              lastDate: dateSelected.add(Duration(days: 365)),
              cancelText: CANCEL,
            ).then((value) {
              if (value != null) {
                //orderPresenter.unSubscribe();
                setState(() {
                  loading = true;
                  dateSelected = value;
                });
                controller.listCompanyOrders(dateSelected).then((value) {
                  setState(() => loading = false);
                  calculateTotalToday(value);
                });
                //orderPresenter.listDayOrdersSnapshot(dateNow);
                //orderPresenter.listDayOrders(dateNow);
              }
            });
          },
        ),
      ),
    );
  }

  bool loading = false;
  Widget refreshBody() {
    return RefreshIndicator(
      key: GlobalKey<RefreshIndicatorState>(),
      onRefresh: () {
        setState(() => loading = true);
        return controller.listCompanyOrders(dateSelected).then((value) {
          setState(() => loading = false);
          calculateTotalToday(value);
        });
      },
      child: loading ? Center(child: CircularProgressIndicator()) : body(),
    );
  }

  Widget body() {
    return CustomFutureBuilder(
      future: controller.ordersList,
      builder: (context, snapshot) {
        var list = snapshot.data as List<Order>;
        if (list.isEmpty) {
          return Center(child: Text("Você ainda não recebeu pedidos hoje!"));
        }
        return ListView(
          children: list.map((e) {
            return GestureDetector(
              child: OrderWidget(data: e),
              onTap: () {
                Get.toNamed('/company/dashboard/order_details', arguments: e);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void calculateTotalToday(List<Order> list) {
    totalToday = 0;
    for (var value in list) {
      double parcialTotal = 0;
      if (!value.canceled && !value.status.isFirst()) {
        parcialTotal += value.deliveryCost;
        value.items.forEach((element) {
          parcialTotal += element.getTotal();
        });
        if (value.cupon != null) {
          parcialTotal += -value.cupon.calcPercentDiscount(parcialTotal) -
              value.cupon.getMoneyDiscount();
        }
      }
      setState(() {
        totalToday += parcialTotal;
      });
    }
  }
}
