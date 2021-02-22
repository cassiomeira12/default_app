import 'item.dart';

class Additional extends Item {
  int amount = 0;
  int maxQuantity;

  Additional();

  Additional.fromMap(Map<dynamic, dynamic>  map) {
    baseFromMap(map);
    name = map["name"];
    description = map["description"];
    cost = (map["cost"] as num).toDouble();
    amount = map["amount"] == null ? 0 : (map["amount"] as num).toInt();
    maxQuantity = map["maxQuantity"] as int;
    visible = map["visible"] == null ? true : map["visible"] as bool;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["objectId"] = objectId;
    map["name"] = name;
    map["description"] = description;
    map["cost"] = cost;
    map["amount"] = amount;
    map["maxQuantity"] = maxQuantity;
    map["visible"] = visible == null ? true : visible;
    return map;
  }

  @override
  void updatedData(Additional item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    description = item.description;
    cost = item.cost;
    amount = item.amount;
    maxQuantity = item.maxQuantity;
    visible = item.visible;
  }


}