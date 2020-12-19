import '../base_model.dart';

class Country extends BaseModel<Country> {
  String name;
  String code;

  Country() : super('Country');

  Country.fromMap(Map<dynamic, dynamic>  map) : super('Country') {
    baseFromMap(map);
    name = map["name"];
    code = map["code"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["code"] = code;
    return map;
  }

  @override
  updateData(Country item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    code = item.code;
  }

}