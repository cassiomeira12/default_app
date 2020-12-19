import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class BaseModel<T> extends ParseObject {
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  BaseModel(String className) : super(className);

  baseFromMap(Map<dynamic, dynamic> map) {
    id = map["objectId"];
    objectId = map["objectId"];
    createdAt = map["createdAt"] == null
        ? null
        : DateTime.parse(map["createdAt"]).toLocal();
    updatedAt = map["updatedAt"] == null
        ? null
        : DateTime.parse(map["updatedAt"]).toLocal();
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["objectId"] = objectId;
    return map;
  }

  void updateData(T item);
}
