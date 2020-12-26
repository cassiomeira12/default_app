import 'package:default_app/app/shared/models/order/order.dart';
import 'package:default_app/app/shared/repositories/parse/parse_order_service.dart';

class OrdersController {
  var service = ParseOrderService();

  Future<List<Order>> ordersList;

  update(item) {
    return service.update(item);
  }

  Future<List<Order>> listCompanyOrders(DateTime day, {int filter, company}) {
    ordersList = service.listCompanyOrders(
      day,
      filter: filter,
      company: company,
    );
    return ordersList;
  }
}
