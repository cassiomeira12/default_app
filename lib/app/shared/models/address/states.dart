import '../base_model.dart';
import 'country.dart';

class States extends BaseModel<States> {
  String name;
  String code;
  String timeAPI;
  Country country;

  States() : super('State');

  States.fromMap(Map<dynamic, dynamic>  map) : super('State') {
    baseFromMap(map);
    name = map["name"];
    code = map["code"];
    timeAPI = map["timeAPI"];
    country = map["country"] == null ? null : Country.fromMap(map["country"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["code"] = code;
    map["timeAPI"] = timeAPI;
    map["country"] = country == null ? null : country.toPointer();
    return map;
  }

  @override
  updateData(States item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    code = item.code;
    timeAPI = item.timeAPI;
    country = item.country;
  }

}