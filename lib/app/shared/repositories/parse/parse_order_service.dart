import 'package:default_app/app/shared/models/order/order.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'base_parse_service.dart';

class ParseOrderService {
  var service = BaseParseService('Order');

  create(item) async {
    // return service.create(item).then((response) {
    //   Order temp = Order();
    //   temp.updateData(item);
    //   temp.id = response["objectId"];
    //   temp.objectId = response["objectId"];
    //   temp.createdAt = DateTime.parse(response["createdAt"]).toLocal();
    //   return response == null ? null : temp;
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  read(item) {
    // return service.read(item).then((response) {
    //   return response == null ? null : Order.fromMap(response);
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  update(item) {
    // return service.update(item).then((response) {
    //   Order temp = Order();
    //   temp.updateData(item);
    //   temp.cupon = item.cupon;
    //   temp.updatedAt = DateTime.parse(response["updatedAt"]).toLocal();
    //   return response == null ? null : temp;
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  delete(item) {
    // return service.delete(item).then((response) {
    //   return response == null ? null : Order.fromMap(response);
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  findBy(String field, value) async {
    // return service.findBy(field, value).then((response) {
    //   return response.isEmpty
    //       ? List<Order>()
    //       : response.map<Order>((item) => Order.fromMap(item)).toList();
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  list() {
    return service.list();
  }

  listCompanyOrders(DateTime day, {int filter, company}) {
    var includes = ["cupon"];

    QueryBuilder query = QueryBuilder(ParseObject('Order'));

    if (company != null) {
      query..whereEqualTo("company", company.toPointer());
    }

    query
      ..whereGreaterThanOrEqualsTo("createdAt", day)
      ..whereLessThan("createdAt", day.add(Duration(days: 1)))
      ..includeObject(includes)
      ..orderByDescending("createdAt");

    return service.query(query, includes: includes).then((value) {
      return value.map<Order>((item) => Order.fromMap(item)).toList();
    });
  }
}
