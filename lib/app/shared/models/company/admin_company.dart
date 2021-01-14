import '../../models/user.dart';
import '../base_model.dart';
import 'company.dart';

class AdminCompany extends BaseModel<AdminCompany> {
  NotificationToken notificationToken;
  User user;
  Company company;

  AdminCompany({String id}) : super('AdminCompany') {
    this.id = id;
    objectId = id;
  }

  AdminCompany.fromMap(Map<dynamic, dynamic> map) : super('_User') {
    baseFromMap(map);
    notificationToken = map["notificationToken"] == null
        ? null
        : NotificationToken.fromMap(map["notificationToken"]);
    user = User.fromMap(map["user"]);
    company = Company.fromMap(map["company"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["notificationToken"] =
        notificationToken == null ? null : notificationToken.toMap();
    map["user"] = user.toPointer();
    map["company"] = company.toPointer();
    return map;
  }

  @override
  void updateData(AdminCompany item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    notificationToken = item.notificationToken;
    user = item.user;
    company = item.company;
  }
}
