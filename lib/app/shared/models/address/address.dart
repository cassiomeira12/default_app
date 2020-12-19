import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../../models/base_user.dart';
import '../../models/address/small_town.dart';
import '../base_model.dart';
import 'city.dart';

class Address extends BaseModel<Address> {
  BaseUser user;
  String zipCode;
  String neighborhood;
  String street;
  String number;
  String reference;
  City city;
  ParseGeoPoint location;
  SmallTown smallTown;

  Address() : super('Address');

  Address.fromMap(Map<dynamic, dynamic>  map) : super('Address') {
    baseFromMap(map);
    user = map["user"] == null ? null : BaseUser.fromMap(map["user"]);
    zipCode = map["zipCode"];
    neighborhood = map["neighborhood"];
    street = map["street"];
    number = map["number"];
    reference = map["reference"];
    city = map["city"] == null ? null : City.fromMap(map["city"]);
    location = map["location"];
    smallTown = map["smallTown"] == null ? null : SmallTown.fromMap(map["smallTown"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["user"] = user == null ? null : user.toPointer();
    map["zipCode"] = zipCode;
    map["neighborhood"] = neighborhood;
    map["street"] = street;
    map["number"] = number;
    map["reference"] = reference;
    map["city"] = city == null ? null : city.toPointer();
    map["location"] = location;
    map["smallTown"] = smallTown == null ? null : smallTown.toPointer();
    return map;
  }

  @override
  Map<String, dynamic> toMapData() {
    var map = super.toMap();
    map["user"] = user == null ? null : user.toMap();
    map["zipCode"] = zipCode;
    map["neighborhood"] = neighborhood;
    map["number"] = number;
    map["street"] = street;
    map["reference"] = reference;
    map["city"] = city == null ? null : city.toMap();
    map["location"] = location;
    map["smallTown"] = smallTown == null ? null : smallTown.toMap();
    return map;
  }

  @override
  updateData(Address item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    user = item.user;
    zipCode = item.zipCode;
    neighborhood = item.neighborhood;
    number = item.number;
    street = item.street;
    reference = item.reference;
    city = item.city;
    location = item.location;
    smallTown = item.smallTown;
  }

}