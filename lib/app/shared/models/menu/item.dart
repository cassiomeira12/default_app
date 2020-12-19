import '../base_model.dart';

class Item extends BaseModel<Item> {
  String name;
  String description;
  double cost;
  bool visible;

  Item() : super('Item');

  Item.fromMap(Map<dynamic, dynamic>  map) : super('Item') {
    baseFromMap(map);
    name = map["name"];
    description = map["description"];
    cost = map["cost"] == null ? null : (map["cost"] as num).toDouble();
    visible = map["visible"] == null ? true : map["visible"] as bool;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["description"] = description;
    map["cost"] = cost;
    map["visible"] = visible == null ? true : visible;
    return map;
  }

  @override
  void updateData(Item item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    description = item.description;
    cost = item.cost;
    visible = item.visible;
  }

  @override
  String toString() {
    return name + (description == null ? "" : " $description") + (cost == null ? "" : " R\$ ${cost.toStringAsFixed(2)}");
  }

}