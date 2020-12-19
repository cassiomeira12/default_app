import 'base_model.dart';

class UserNotification extends BaseModel<UserNotification> {
  String title;
  String message;
  String observacao;
  bool read = false;
  String avatarURL;
  String paymentType;

  UserNotification() : super('UserNotification');

  UserNotification.fromMap(Map map) : super('UserNotification') {
    objectId = map["objectId"];
    id = objectId;
    title = map["title"];
    message = map["message"];
    observacao = map["observacao"];
    read = map["read"] == null ? true : map["read"] as bool;
    createdAt = map["createdAt"] == null ? null : DateTime.parse(map["createdAt"]);
    avatarURL = map["avatarURL"];
    paymentType = map["type"];
  }

  @override
  updateData(UserNotification item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    message = item.message;
    observacao = item.observacao;
    read = item.read;
    createdAt = item.createdAt;
    avatarURL = item.avatarURL;
    paymentType = item.paymentType;
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map["objectId"] = id;
    map["title"] = title;
    map["message"] = message;
    map["observacao"] = observacao;
    map["read"] = read;
    map["createdAt"] = createdAt == null ? null : createdAt.toString();
    map["avatarURL"] = avatarURL;
    map["type"] = paymentType;
    return map;
  }

}