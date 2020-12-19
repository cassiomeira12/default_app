import 'package:default_app/app/shared/models/order/order.dart';
import 'package:default_app/app/shared/repositories/parse/parse_order_service.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class OrdersController {
  var service = ParseOrderService();

  Future<List<Order>> ordersList;

  update(item) {
    return service.update(item);
  }

  Future<List<Order>> listCompanyOrders(DateTime day, {int filter, company}) {
    var includes = ["cupon"];

    QueryBuilder query = QueryBuilder(ParseObject('Order'));

    if (company != null) {
      query..whereEqualTo("company", company.toPointer());
    }

    query
      ..whereGreaterThanOrEqualsTo(
          "createdAt", day.subtract(Duration(days: 10)))
      ..whereLessThan("createdAt", day.add(Duration(days: 1)))
      ..includeObject(includes)
      ..orderByDescending("createdAt");

    ordersList = service.query(query, includes: includes);

    return ordersList;
  }
}
