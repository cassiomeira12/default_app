import '../../models/menu/choice_selected.dart';
import '../../models/menu/product.dart';
import '../../models/menu/additional.dart';
import '../base_model.dart';

class OrderItem extends BaseModel<OrderItem> {
  String name;
  String description;
  double cost;
  double discount;
  PreparationTime preparationTime;
  int amount;
  List<ChoiceSelected> choicesSelected;
  List<Additional> additionalSelected;
  String note;

  OrderItem() : super('OrderItem') {
    choicesSelected = List();
    additionalSelected = List();
  }

  OrderItem.fromMap(Map<dynamic, dynamic>  map) : super('OrderItem') {
    baseFromMap(map);
    name = map["name"];
    description = map["description"];
    cost = (map["cost"] as num).toDouble();
    discount = (map["discount"] as num).toDouble();
    preparationTime = map["preparationTime"] == null ? null : PreparationTime.fromMap(map["preparationTime"]);
    amount = map["amount"] as int;
    choicesSelected = map["choicesSelected"] == null ?
        List() :
        List.from(map["choicesSelected"]).map<ChoiceSelected>((e) => ChoiceSelected.fromMap(e)).toList();
    additionalSelected = map["additionalSelected"] == null ?
        List() :
        List.from(map["additionalSelected"]).map<Additional>((e) => Additional.fromMap(e)).toList();
    note = map["note"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["description"] = description;
    map["cost"] = cost;
    map["discount"] = discount;
    map["preparationTime"] = preparationTime == null ? null : preparationTime.toMap();
    map["amount"] = amount;
    map["choicesSelected"] = choicesSelected == null ?
        null :
        choicesSelected.map((e) => e.toMap()).toList();
    map["additionalSelected"] = additionalSelected == null ?
        null :
        additionalSelected.map((e) => e.toMap()).toList();
    map["note"] = note;
    return map;
  }

  @override
  updateData(OrderItem item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    description = item.description;
    cost = item.cost;
    discount = item.discount;
    preparationTime = item.preparationTime;
    amount = item.amount;
    choicesSelected = item.choicesSelected;
    additionalSelected = item.additionalSelected;
    note = item.note;
  }

  double getTotal() {
    double total = amount * cost;

    choicesSelected.forEach((element) {
      element.choiceSelected.forEach((item) {
        total += amount * item.cost;
      });
    });

    additionalSelected.forEach((element) {
      total += element.amount * element.cost;
    });

    return total;
  }

}