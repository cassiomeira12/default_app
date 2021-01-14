import '../../models/address/address.dart';
import '../../models/company/company.dart';
import '../../models/company/type_payment.dart';
import '../../models/menu/product.dart';
import '../../models/order/evaluation.dart';
import '../../models/order/order_item.dart';
import '../../models/phone_number.dart';
import '../../models/user.dart';
import '../base_model.dart';
import 'cupon.dart';
import 'order_status.dart';

class Order extends BaseModel<Order> {
  User user;
  String userName;
  Company company;
  String companyName;
  String note;
  Evaluation evaluation;
  Address deliveryAddress;
  TypePayment typePayment;
  List<OrderItem> items;
  OrderStatus status;
  String changeMoney;
  bool delivery;
  double deliveryCost;
  DeliveryForecast deliveryForecast;
  PreparationTime preparationTime;
  PhoneNumber companyPhoneNumber;
  PhoneNumber userPhoneNumber;
  bool canceled;
  Cupon cupon;

  Order() : super('Order') {
    items = List();
  }

  Order.fromMap(Map<dynamic, dynamic> map) : super('Order') {
    baseFromMap(map);
    user = map["user"] == null ? null : User.fromMap(map["user"]);
    userName = map["userName"];
    company = map["company"] == null ? null : Company.fromMap(map["company"]);
    companyName = map["companyName"];
    note = map["note"];
    evaluation = map["evaluation"] == null
        ? null
        : Evaluation.fromMap(map["evaluation"]);
    deliveryAddress = map["deliveryAddress"] == null
        ? null
        : Address.fromMap(map["deliveryAddress"]);
    deliveryCost = (map["deliveryCost"] as num).toDouble();
    typePayment = map["typePayment"] == null
        ? null
        : TypePayment.fromMap(map["typePayment"]);
    items = List.from(map["items"])
        .map<OrderItem>((e) => OrderItem.fromMap(e))
        .toList();
    status = OrderStatus.fromMap(map["status"]);
    changeMoney = map["changeMoney"];
    delivery =
        map["delivery"] == null ? deliveryCost != 0 : map["delivery"] as bool;
    deliveryForecast = map["deliveryForecast"] == null
        ? null
        : DeliveryForecast.fromMap(map["deliveryForecast"]);
    preparationTime = map["preparationTime"] == null
        ? null
        : PreparationTime.fromMap(map["preparationTime"]);
    companyPhoneNumber = map["companyPhoneNumber"] == null
        ? null
        : PhoneNumber.fromMap(map["companyPhoneNumber"]);
    userPhoneNumber = map["userPhoneNumber"] == null
        ? null
        : PhoneNumber.fromMap(map["userPhoneNumber"]);
    canceled = map["canceled"] == null ? false : map["canceled"] as bool;
    cupon = map["cupon"] == null ? null : Cupon.fromMap(map["cupon"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["user"] = user == null ? null : user.toPointer();
    map["userName"] = userName;
    map["company"] = company == null ? null : company.toPointer();
    map["companyName"] = companyName;
    map["note"] = note;
    map["evaluation"] = evaluation == null ? null : evaluation.toMap();
    map["deliveryAddress"] =
        deliveryAddress == null ? null : deliveryAddress.toMap();
    map["deliveryCost"] = deliveryCost;
    map["typePayment"] = typePayment == null ? null : typePayment.toMap();
    map["items"] = items.map<Map>((e) => e.toMap()).toList();
    map["status"] = status.toMap();
    map["changeMoney"] = changeMoney;
    map["delivery"] = delivery == null ? deliveryCost != 0 : delivery;
    map["deliveryForecast"] =
        deliveryForecast == null ? null : deliveryForecast.toMap();
    map["preparationTime"] =
        preparationTime == null ? null : preparationTime.toMap();
    map["companyPhoneNumber"] =
        companyPhoneNumber == null ? null : companyPhoneNumber.toMap();
    map["userPhoneNumber"] =
        userPhoneNumber == null ? null : userPhoneNumber.toMap();
    map["canceled"] = canceled == null ? false : canceled;
    map["cupon"] = cupon == null ? null : cupon.toPointer();
    return map;
  }

  @override
  updateData(Order item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    user = item.user;
    userName = item.userName;
    company = item.company;
    companyName = item.companyName;
    note = item.note;
    evaluation = item.evaluation;
    deliveryAddress = item.deliveryAddress;
    deliveryCost = item.deliveryCost;
    typePayment = item.typePayment;
    items = item.items;
    status = item.status;
    changeMoney = item.changeMoney;
    deliveryCost = item.deliveryCost;
    deliveryForecast = item.deliveryForecast;
    preparationTime = item.preparationTime;
    companyPhoneNumber = item.companyPhoneNumber;
    userPhoneNumber = item.userPhoneNumber;
    canceled = item.canceled;
    cupon = item.cupon;
  }

  clear() {
    id = null;
    user = null;
    userName = null;
    company = null;
    companyName = null;
    createdAt = null;
    updatedAt = null;
    note = null;
    evaluation = null;
    deliveryAddress = null;
    deliveryCost = 0;
    typePayment = null;
    items = List();
    status = OrderStatus();
    changeMoney = null;
    delivery = deliveryCost != 0;
    deliveryForecast = null;
    preparationTime = null;
    companyPhoneNumber = null;
    userPhoneNumber = null;
    canceled = false;
    cupon = null;
  }
}

class DeliveryForecast extends BaseModel<DeliveryForecast> {
  int hour, minute;

  DeliveryForecast() : super('DeliveryForecast');

  DeliveryForecast.fromMap(Map<dynamic, dynamic> map)
      : super('DeliveryForecast') {
    baseFromMap(map);
    hour = map["hour"];
    minute = map["minute"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["hour"] = hour;
    map["minute"] = minute;
    return map;
  }

  @override
  updateData(DeliveryForecast item) {
    id = item.id;
    objectId = item.objectId;
    hour = item.hour;
    minute = item.minute;
  }

  @override
  String toString() {
    String hora = hour < 10 ? "0${hour}" : hour.toString();
    String minutos = minute < 10 ? "0${minute}" : minute.toString();
    return "${hora}:${minutos}h";
  }
}
