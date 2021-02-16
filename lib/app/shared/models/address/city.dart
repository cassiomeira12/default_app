import '../../models/address/states.dart';
import '../base_model.dart';

class City extends BaseModel<City> {
  String name;
  States state;

  City() : super('City');

  City.fromMap(Map<dynamic, dynamic>  map) : super('City') {
    baseFromMap(map);
    name = map["name"];
    state = map["state"] == null ? null : States.fromMap(map["state"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["state"] = state == null ? null : state.toMap();
    return map;
  }

  @override
  updateData(City item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    state = item.state;
  }

  @override
  String toString() {
    return name;
  }

}