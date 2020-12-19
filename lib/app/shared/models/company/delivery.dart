import '../base_model.dart';

class Delivery extends BaseModel<Delivery> {
  String name;
  double cost; // centavos
  bool delivery, pickup;

  Delivery() : super('Delivery');

  Delivery.fromMap(Map<dynamic, dynamic> map) : super('Delivery') {
    baseFromMap(map);
    name = map["name"];
    cost = (map["cost"] as num).toDouble();
    delivery = map["delivery"] ?? true;
    pickup = map["pickup"] as bool;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["cost"] = cost;
    map["delivery"] = delivery ?? true;
    map["pickup"] = pickup;
    return map;
  }

  @override
  updateData(Delivery item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    cost = item.cost;
    delivery = item.delivery;
    pickup = item.pickup;
  }
}
