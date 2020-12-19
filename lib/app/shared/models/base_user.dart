import '../models/status.dart';
import 'base_model.dart';
import 'phone_number.dart';

class BaseUser extends BaseModel<BaseUser> {
  NotificationToken notificationToken;
  String avatarURL;
  Status status;
  String username;
  String name;
  String email;
  bool emailVerified;
  String password;
  PhoneNumber phoneNumber;
  bool socialProvider;

  BaseUser({String id}) : super('_User') {
    this.id = id;
    objectId = id;
  }

  BaseUser.fromMap(Map<dynamic, dynamic> map) : super('_User') {
    baseFromMap(map);
    notificationToken = map["notificationToken"] == null
        ? null
        : NotificationToken.fromMap(map["notificationToken"]);
    avatarURL = map["avatarURL"];
    username = map["username"];
    name = map["name"];
    email = map["email"];
    emailVerified =
        map["emailVerified"] == null ? false : map["emailVerified"] as bool;
    password = map["password"];
    createdAt = map["createdAt"] == null
        ? null
        : DateTime.parse(map["createdAt"]).toLocal();
    updatedAt = map["updatedAt"] == null
        ? null
        : DateTime.parse(map["updatedAt"]).toLocal();
    phoneNumber = map["phoneNumber"] == null
        ? null
        : PhoneNumber.fromMap(map["phoneNumber"]);
    socialProvider =
        map["socialProvider"] == null ? false : map["socialProvider"] as bool;
  }

  toMap() {
    var map = super.toMap();
    map["notificationToken"] =
        notificationToken == null ? null : notificationToken.toMap();
    map["avatarURL"] = avatarURL;
    map["username"] = username;
    map["name"] = name;
    map["email"] = email;
    //map["emailVerified"] = emailVerified;
    map["password"] = password;
    map["createdAt"] = createdAt == null ? null : createdAt.toString();
    map["updatedAt"] = updatedAt == null ? null : updatedAt.toString();
    map["phoneNumber"] = phoneNumber == null ? null : phoneNumber.toMap();
    map["socialProvider"] = socialProvider;
    return map;
  }

  updateData(BaseUser item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    notificationToken = item.notificationToken;
    avatarURL = item.avatarURL;
    status = item.status;
    username = item.username;
    name = item.name;
    email = item.email;
    emailVerified = item.emailVerified;
    password = item.password;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;
    phoneNumber = item.phoneNumber;
    socialProvider = item.socialProvider;
  }

  bool isAnonymous() {
    return name.isEmpty &&
        username.isEmpty &&
        email.isEmpty &&
        password.isEmpty;
  }
}

class NotificationToken extends BaseModel<NotificationToken> {
  String token;
  bool active;
  List<String> topics;

  NotificationToken(this.token) : super('NotificationToken') {
    active = true;
  }

  NotificationToken.fromMap(Map<dynamic, dynamic> map)
      : super('NotificationToken') {
    baseFromMap(map);
    token = map["token"];
    active = map["active"] as bool;
    topics = map["topics"] == null ? List() : List.from(map["topics"]);
  }

  toMap() {
    var map = super.toMap();
    map["token"] = token;
    map["active"] = active;
    map["topics"] = topics == null ? List() : topics;
    return map;
  }

  @override
  void updateData(NotificationToken item) {
    id = item.id;
    objectId = item.objectId;
    token = item.token;
    active = item.active;
    topics = item.topics;
  }
}
