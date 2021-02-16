import '../models/base_model.dart';

class VersionApp extends BaseModel<VersionApp> {
  String name;
  int currentCode;
  int minimumCode;
  String storeUrl;

  VersionApp.fromMap(Map<dynamic, dynamic> map) : super('VersionApp') {
    baseFromMap(map);
    name = map["name"];
    currentCode = (map["currentCode"] as num).toInt();
    minimumCode = (map["minimumCode"] as num).toInt();
    storeUrl = map["storeUrl"];
  }

  toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["currentCode"] = currentCode;
    map["minimumCode"] = minimumCode;
    map["storeUrl"] = storeUrl;
    return map;
  }

  @override
  void updateData(VersionApp item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    currentCode = item.currentCode;
    minimumCode = item.minimumCode;
    storeUrl = item.storeUrl;
  }

}