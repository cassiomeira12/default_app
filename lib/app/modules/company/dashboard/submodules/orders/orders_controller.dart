import 'package:default_app/app/shared/models/order/order.dart';
import 'package:default_app/app/shared/repositories/parse/parse_order_service.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class OrdersController {
  var service = ParseOrderService();

  Future<List<Order>> ordersList;

  LiveQuery liveQuery;
  Subscription subscriptionCreate, subscriptionUpdate;

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

  void pause() {
    if (liveQuery != null) liveQuery.client.disconnect();
  }

  void resume() {
    if (liveQuery != null) liveQuery.client.reconnect();
  }

  void unSubscribe() {
    if (liveQuery != null) {
      liveQuery.client.unSubscribe(subscriptionCreate);
      liveQuery.client.unSubscribe(subscriptionUpdate);
    }
  }

  @override
  dispose() {
    //orderService = null;
    if (liveQuery != null) {
      if (subscriptionCreate != null) {
        liveQuery.client.unSubscribe(subscriptionCreate);
      }
      if (subscriptionUpdate != null) {
        liveQuery.client.unSubscribe(subscriptionUpdate);
      }
    }
  }

  Future<Order> readSnapshot(Order item) async {
    liveQuery = LiveQuery();

    QueryBuilder query = QueryBuilder(ParseObject("Order"))
      ..whereEqualTo("objectId", item.id);

    subscriptionUpdate = await liveQuery.client.subscribe(query);

    subscriptionUpdate.on(LiveQueryEvent.update, (value) async {
      var order = Order.fromMap(value.toJson());
      var cuponJson = value["cupon"];
      if (cuponJson != null) {
        // var cupon =
        // await cuponService.read(Cupon()..id = cuponJson["objectId"]);
        // order.cupon = cupon;
      }
      //_view != null ? _view.onSuccess(order) : null;
    });
  }

  Future<List<Order>> listDayOrdersSnapshot(DateTime day, {company}) async {
    var includes = ["cupon"];
    liveQuery = LiveQuery();

    QueryBuilder query;

    if (kDebugMode) {
      query = QueryBuilder(ParseObject("Order"))
        //..whereEqualTo("company", Singletons.company().toPointer())
        ..whereGreaterThanOrEqualsTo("createdAt", day)
        ..whereLessThan("createdAt", day.add(Duration(days: 1)))
        ..includeObject(includes)
        ..orderByDescending("createdAt");
    } else {
      query = QueryBuilder(ParseObject("Order"))
        ..whereEqualTo("company", company.toPointer())
        ..whereGreaterThanOrEqualsTo("createdAt", day)
        ..whereLessThan("createdAt", day.add(Duration(days: 1)))
        ..includeObject(includes)
        ..orderByDescending("createdAt");
    }

    subscriptionCreate = await liveQuery.client.subscribe(query);
    subscriptionUpdate = await liveQuery.client.subscribe(query);

    subscriptionCreate.on(LiveQueryEvent.create, (value) async {
      var order = Order.fromMap(value.toJson());
      var cuponJson = value["cupon"];
      // if (cuponJson != null) {
      //   var cupon =
      //       await cuponService.read(Cupon()..id = cuponJson["objectId"]);
      //   order.cupon = cupon;
      // }
      // if (order.createdAt.isAfter(day) &&
      //     order.createdAt.isBefore(day.add(Duration(days: 1)))) {
      //   if (_view != null) {
      //     _view.listSuccess([order]);
      //   }
      // }
    });

    //int filter = await PreferencesUtil.getOrderFilter();

    subscriptionUpdate.on(LiveQueryEvent.update, (value) async {
      var order = Order.fromMap(value.toJson());
      var cuponJson = value["cupon"];
      if (cuponJson != null) {
        // var cupon =
        //     await cuponService.read(Cupon()..id = cuponJson["objectId"]);
        // order.cupon = cupon;
      }
      if (order.createdAt.isAfter(day) &&
          order.createdAt.isBefore(day.add(Duration(days: 1)))) {
        var current = order.status.current;
        var index = order.status.getIndex(current);

        // if (filter == null) {
        //   filter = 0;
        // }

        // switch (filter) {
        //   case 0:
        //     _view != null ? _view.listSuccess([order]) : null;
        //     break;
        //   case 1:
        //     if (index > 0 && index < 3) {
        //       _view != null ? _view.listSuccess([order]) : null;
        //     } else {
        //       _view != null ? _view.removeOrder(order) : null;
        //     }
        //     break;
        //   case 2:
        //     if (index > 2 && index < 5) {
        //       _view != null ? _view.listSuccess([order]) : null;
        //     } else {
        //       _view != null ? _view.removeOrder(order) : null;
        //     }
        //     break;
        //   case 3:
        //     if (index > 4) {
        //       _view != null ? _view.listSuccess([order]) : null;
        //     } else {
        //       _view != null ? _view.removeOrder(order) : null;
        //     }
        //     break;
        // }
      }
    });
  }
}
