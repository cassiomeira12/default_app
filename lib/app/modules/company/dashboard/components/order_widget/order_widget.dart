import 'package:default_app/app/components/stars_widget/stars_widget.dart';
import 'package:default_app/app/shared/models/order/order.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:default_app/app/utils/date_util.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  Order data;

  OrderWidget({this.data});

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  double total = 0;

  @override
  void initState() {
    super.initState();
    total = widget.data.deliveryCost;
    widget.data.items.forEach((element) {
      total += element.getTotal();
    });
    if (widget.data.cupon != null) {
      total += -widget.data.cupon.calcPercentDiscount(total) -
          widget.data.cupon.getMoneyDiscount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      elevation: 5,
      shadowColor: widget.data.canceled
          ? Colors.red
          : widget.data.status.isLast()
              ? widget.data.evaluation == null
                  ? Colors.amber
                  : Colors.white
              : widget.data.status.isFirst()
                  ? Colors.green
                  : Colors.lightBlue,
      color: widget.data.canceled
          ? Colors.white
          : widget.data.status.isLast()
              ? widget.data.evaluation == null
                  ? Colors.amber[100]
                  : Colors.white
              : widget.data.status.isFirst()
                  ? Colors.green[50]
                  : Colors.lightBlue[50],
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleTextWidget(widget.data.userName),
                dateTextWidget(DateUtil.formatDateCalendar(DateTime.now())),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.data.evaluation == null
                    ? Flexible(
                        flex: 1,
                        child: Text(
                          widget.data.canceled
                              ? "Esse pedido foi cancelado"
                              : '${widget.data.status.current.name}',
                          overflow: TextOverflow.ellipsis,
                          style: fontMessage(
                            context,
                            size: 16,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    : StarsWidget(
                        initialStar: widget.data.evaluation.stars,
                        size: 30,
                      ),
                widget.data.canceled
                    ? Container()
                    : costTextWidget("R\$ ${total.toStringAsFixed(2)}"),
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
        style: fontSubtitle(
          context,
          size: 25,
          bold: true,
          color: Colors.black87,
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
        style: fontSubtitle(
          context,
          size: 18,
          color: Colors.black87,
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
        style: fontSubtitle(
          context,
          size: 18,
          bold: true,
          color: Colors.black87,
        ),
      ),
    );
  }
}
