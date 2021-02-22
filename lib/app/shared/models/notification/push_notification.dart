import '../../models/company/company.dart';
import '../base_model.dart';
import '../user.dart';

class PushNotification extends BaseModel<PushNotification> {
  String title, message, topic;
  Company senderCompany;
  User senderUser, destinationUser;
  bool validated, denied;

  PushNotification() : super('PushNotification') {
    validated = false;
    denied = false;
  }

  PushNotification.fromMap(Map<dynamic, dynamic> map)
      : super('PushNotification') {
    baseFromMap(map);
    title = map["title"];
    message = map["message"];
    topic = map["topic"];
    senderCompany = map["senderCompany"] == null
        ? null
        : Company.fromMap(map["senderCompany"]);
    senderUser =
        map["senderUser"] == null ? null : User.fromMap(map["senderUser"]);
    destinationUser = map["destinationUser"] == null
        ? null
        : User.fromMap(map["destinationUser"]);
    validated = map["validated"] as bool;
    denied = map["denied"] as bool;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["title"] = title;
    map["message"] = message;
    map["topic"] = topic;
    map["senderCompany"] =
        senderCompany == null ? null : senderCompany.toPointer();
    map["senderUser"] = senderUser == null ? null : senderUser.toPointer();
    map["destinationUser"] =
        destinationUser == null ? null : destinationUser.toPointer();
    map["validated"] = validated;
    map["denied"] = denied;
    return map;
  }

  @override
  void updateData(PushNotification item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    title = item.title;
    message = item.message;
    topic = item.topic;
    senderCompany = item.senderCompany;
    senderUser = item.senderUser;
    destinationUser = item.destinationUser;
    validated = item.validated;
    denied = item.denied;
  }

  String getStateName() {
    if (denied) {
      return "Negado";
    } else {
      if (validated) {
        return "Aprovado";
      } else {
        return "Em análise";
      }
    }
  }
}
