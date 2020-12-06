import 'package:default_app/app/components/stars_widget/stars_widget.dart';
import 'package:default_app/app/utils/date_util.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
      elevation: 5,
//      shadowColor: order.canceled
//          ? Colors.red
//          : order.status.isLast()
//              ? order.evaluation == null ? Colors.amber : Colors.white
//              : order.status.isFirst() ? Colors.green : Colors.lightBlue,
//      color: order.canceled
//          ? Colors.white
//          : order.status.isLast()
//              ? order.evaluation == null ? Colors.amber[100] : Colors.white
//              : order.status.isFirst()
//                  ? Colors.green[50]
//                  : Colors.lightBlue[50],
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleTextWidget("Cássio"),
                dateTextWidget(DateUtil.formatDateCalendar(DateTime.now())),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //order.evaluation == null
                true
                    ? Flexible(
                        flex: 1,
                        child: Text(
                          //order.canceled
                          false
                              ? "Esse pedido foi cancelado"
                              : 'Pedido enviado', //"order.status.current.name",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.body2,
                        ),
                      )
                    : StarsWidget(
                        initialStar: 5, //order.evaluation.stars,
                        size: 30,
                      ),
                //order.canceled
                true
                    ? Container()
                    : costTextWidget("R\$ total.toStringAsFixed(2)"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget titleTextWidget(String text) {
    return Flexible(
      child: Text(
        text,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 25,
          color: Colors.black45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget dateTextWidget(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black45,
        ),
      ),
    );
  }

  Widget costTextWidget(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 18, color: Colors.black45, fontWeight: FontWeight.bold),
      ),
    );
  }
}
