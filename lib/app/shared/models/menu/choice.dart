import '../base_model.dart';
import 'item.dart';

class Choice extends BaseModel<Choice> {
  String name;
  String description;
  bool required;
  int maxQuantity;
  int minQuantity;
  List<Item> itens;

  Choice() : super('Choice') {
    itens = List();
  }

  Choice.fromMap(Map<dynamic, dynamic>  map) : super('Choice') {
    baseFromMap(map);
    name = map["name"];
    description = map["description"];
    required = map["required"] == true;
    maxQuantity = map["maxQuantity"] as int;
    minQuantity = map["minQuantity"] as int;
    itens = List.from(map["itens"]).map<Item>((e) => Item.fromMap(e)).toList();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["description"] = description;
    map["required"] = required;
    map["maxQuantity"] = maxQuantity;
    map["minQuantity"] = minQuantity;
    map["itens"] = itens.map<Map>((e) => e.toMap()).toList();
    return map;
  }

  @override
  updateData(Choice item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    description = item.description;
    required = item.required;
    maxQuantity = item.maxQuantity;
    minQuantity = item.minQuantity;
    itens = item.itens;
  }

}