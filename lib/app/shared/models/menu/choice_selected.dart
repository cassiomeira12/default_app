import '../../models/base_model.dart';
import 'item.dart';

class ChoiceSelected extends BaseModel<ChoiceSelected> {
  String name;
  String description;
  bool required;
  int maxQuantity;
  int minQuantity;
  List<Item> choiceSelected;

  ChoiceSelected() : super('ChoiceSelected') {
    choiceSelected = List();
  }

  ChoiceSelected.fromMap(Map<dynamic, dynamic>  map) : super('ChoiceSelected') {
    baseFromMap(map);
    name = map["name"];
    description = map["description"];
    required = map["required"] as bool;
    maxQuantity = (map["maxQuantity"] as num).toInt();
    minQuantity = (map["minQuantity"] as num).toInt();
    choiceSelected = map["choiceSelected"] == null ?
    List() : List.from(map["choiceSelected"]).map<Item>((e) => Item.fromMap(e)).toList();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["description"] = description;
    map["required"] = required;
    map["maxQuantity"] = maxQuantity;
    map["minQuantity"] = minQuantity;
    map["choiceSelected"] = choiceSelected.map<Map>((e) => e.toMap()).toList();
    return map;
  }

  @override
  void updateData(ChoiceSelected item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    description = item.description;
    required = item.required;
    maxQuantity = item.maxQuantity;
    minQuantity = item.minQuantity;
    choiceSelected = item.choiceSelected;
  }

  @override
  String toString() {
    String result = "$name - ";
    choiceSelected.asMap().forEach((key, value) {
      if (key == 0) {
        result += "${value.name}";
        result += value.cost > 0 ? " R\$ ${value.cost.toStringAsFixed(2)}" : "";
      } else {
        result += ", ${value.name}";
        result += value.cost > 0 ? " R\$ ${value.cost.toStringAsFixed(2)}" : "";
      }
    });
    result += ";";
    return result;
  }

}