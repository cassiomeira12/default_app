import 'package:latlong/latlong.dart';
import '../base_model.dart';
import 'city.dart';

class SmallTown extends BaseModel<SmallTown> {
  String name;
  City city;
  LatLng location;

  SmallTown() : super('SmallTown');

  SmallTown.fromMap(Map<dynamic, dynamic>  map) : super('SmallTown') {
    baseFromMap(map);
    name = map["name"];
    city = map["city"] == null ? null : City.fromMap(map["city"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["city"] = city == null ? null : city.toMap();
    return map;
  }

  @override
  updateData(SmallTown item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    city = item.city;
    location = item.location;
  }

  @override
  String toString() {
    return name;
  }

}