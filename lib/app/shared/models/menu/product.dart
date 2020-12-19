import '../../models/menu/additional.dart';
import '../../models/menu/choice.dart';
import '../base_model.dart';

class Product extends BaseModel<Product> {
  String name;
  String description;
  double cost;
  double discount;
  PreparationTime preparationTime;
  List<String> images;
  List<Choice> choices;
  List<Additional> additional;
  bool visible;

  Product() : super('Product');

  Product.fromMap(Map<dynamic, dynamic>  map) : super('Product') {
    baseFromMap(map);
    name = map["name"];
    description = map["description"];
    cost = (map["cost"] as num).toDouble();
    discount = (map["discount"] as num).toDouble();
    preparationTime = map["preparationTime"] == null ? null : PreparationTime.fromMap(map["preparationTime"]);
    images = map["images"] == null ? List() : List.from(map["images"]);
    choices = map["choices"] == null ? List() : List.from(map["choices"]).map<Choice>((e) => Choice.fromMap(e)).toList();
    additional = map["additional"] == null ? List() : List.from(map["additional"]).map<Additional>((e) => Additional.fromMap(e)).toList();
    visible = map["visible"] == null ? true : map["visible"] as bool;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["description"] = description;
    map["cost"] = cost;
    map["discount"] = discount;
    map["preparationTime"] = preparationTime == null ? null : preparationTime.toMap();
    map["images"] = images == null ? List() : images;
    map["choices"] = choices == null ? List() : choices.map<Map>((e) => e.toMap()).toList();
    map["additional"] = additional == null ? List() : additional.map((e) => e.toMap()).toList();
    map["visible"] = visible == null ? true : visible;
    return map;
  }

  @override
  updateData(Product item) {
    id = item.id;
    objectId = item.objectId;
    name = item.name;
    description = item.description;
    cost = item.cost;
    discount = item.discount;
    preparationTime = item.preparationTime;
    images = item.images;
    choices = item.choices;
    additional = item.additional;
    visible = item.visible == null ? true : item.visible;
  }

}

class PreparationTime extends BaseModel<PreparationTime> {
  int hour, minute;

  PreparationTime() : super('PreparationTime');

  PreparationTime.fromMap(Map<dynamic, dynamic>  map) : super('PreparationTime') {
    baseFromMap(map);
    hour = map["hour"] as int;
    minute = map["minute"] as int;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["hour"] = hour;
    map["minute"] = minute;
    return map;
  }

  @override
  updateData(PreparationTime item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    hour = item.hour;
    minute = item.minute;
  }

  @override
  String toString() {
    return hour == 0 ? "$minute min" : "${hour}h ${minute}min";
  }

}

class Size {
  String name;
  String description;

  Size();

  Size.fromMap(Map<dynamic, dynamic>  map) {
    name = map["name"];
    description = map["description"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    return map;
  }

}

class Ingredient {
  String name;
  String description;
  double cost;

  Ingredient.fromMap(Map<dynamic, dynamic>  map) {
    name = map["name"];
    description = map["description"];
    cost = map["description"] as double;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["cost"] = cost;
    return map;
  }

}