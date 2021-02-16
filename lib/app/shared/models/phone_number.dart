import '../models/base_model.dart';

class PhoneNumber extends BaseModel<PhoneNumber> {
  String countryCode;
  String ddd;
  String number;
  bool verified;

  PhoneNumber() : super('PhoneNumber');

  PhoneNumber.fromMap(Map<dynamic, dynamic>  map) : super('PhoneNumber') {
    baseFromMap(map);
    countryCode = map["countryCode"];
    ddd = map["ddd"];
    number = map["number"];
    verified = map["verified"] == null ? false : map["verified"] as bool;
  }

  toMap() {
    var map = super.toMap();
    map["countryCode"] = countryCode;
    map["ddd"] = ddd;
    map["number"] = number;
    map["verified"] = verified == null ? false : verified;
    return map;
  }

  @override
  void updateData(PhoneNumber item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    countryCode = item.countryCode;
    ddd = item.ddd;
    number = item.number;
    verified = item.verified;
  }

  String whatsAppLink() {
    return "https://api.whatsapp.com/send?phone=$countryCode$ddd$number";
  }

  @override
  String toString() {
    return countryCode+" ("+ddd+") "+number;
  }

}