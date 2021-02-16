import '../../../utils/date_util.dart';
import '../../models/address/address.dart';
import '../../models/company/opening_hour.dart';
import '../../models/company/type_payment.dart';
import '../../models/order/order_status.dart';
import '../../models/phone_number.dart';
import '../base_model.dart';
import 'delivery.dart';

class Company extends BaseModel<Company> {
  String topic;
  String name;
  String cnpj;
  String logoURL;
  String bannerURL;
  List<OpeningHour> openHours;
  Address address;
  List<TypePayment> typePayments;
  Delivery delivery;
  PhoneNumber phoneNumber;

  OrderStatus deliveryStatus;
  OrderStatus pickupStatus;

  Company() : super('Company') {
    openHours = List();
    typePayments = List();
  }

  Company.fromMap(Map<dynamic, dynamic> map) : super('Company') {
    objectId = map["objectId"];
    id = objectId;
    topic = map["topic"];
    name = map["name"];
    cnpj = map["cnpj"];
    logoURL = map["logo"] == null ? null : (map["logo"] as dynamic)["url"];
    bannerURL =
        map["banner"] == null ? null : (map["banner"] as dynamic)["url"];
    openHours = map["openHours"] == null
        ? List()
        : List.from(map["openHours"])
            .map<OpeningHour>((e) => OpeningHour.fromMap(e))
            .toList();
    address = map["address"] == null ? null : Address.fromMap(map["address"]);
    typePayments = map["typePayments"] == null
        ? List()
        : List.from(map["typePayments"])
            .map<TypePayment>((e) => TypePayment.fromMap(e))
            .toList();
    delivery =
        map["delivery"] == null ? null : Delivery.fromMap(map["delivery"]);
    phoneNumber = map["phoneNumber"] == null
        ? null
        : PhoneNumber.fromMap(map["phoneNumber"]);
    deliveryStatus = map["deliveryStatus"] == null
        ? null
        : OrderStatus.fromMap(map["deliveryStatus"]);
    pickupStatus = map["pickupStatus"] == null
        ? null
        : OrderStatus.fromMap(map["pickupStatus"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["objectId"] = id;
    map["topic"] = topic;
    map["name"] = name;
    map["cnpj"] = cnpj;
    map["logoURL"] = logoURL;
    map["bannerURL"] = bannerURL;
    map["openHours"] = openHours == null
        ? List()
        : openHours.map<Map>((e) => e.toMap()).toList();
    map["address"] = address.toPointer();
    map["typePayments"] = typePayments == null
        ? List()
        : typePayments.map<Map>((e) => e.toMap()).toList();
    map["delivery"] = delivery == null ? null : delivery.toMap();
    map["phoneNumber"] = phoneNumber == null ? null : phoneNumber.toMap();
    map["deliveryStatus"] =
        deliveryStatus == null ? null : deliveryStatus.toPointer();
    map["pickupStatus"] =
        pickupStatus == null ? null : pickupStatus.toPointer();
    return map;
  }

  @override
  void updateData(Company item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    topic = item.topic;
    name = item.name;
    cnpj = item.cnpj;
    logoURL = item.logoURL;
    bannerURL = item.bannerURL;
    openHours = item.openHours;
    address = item.address;
    typePayments = item.typePayments;
    delivery = item.delivery;
    phoneNumber = item.phoneNumber;
    deliveryStatus = item.deliveryStatus;
    pickupStatus = item.pickupStatus;
  }

  void clear() {
    id = null;
    objectId = null;
    topic = null;
    name = null;
    cnpj = null;
    logoURL = null;
    bannerURL = null;
    openHours = null;
    address = null;
    typePayments = null;
    delivery = null;
    phoneNumber = null;
    deliveryStatus = null;
    pickupStatus = null;
  }

  bool isTodayOpen() {
    OpeningHour openingHourToday;
    openHours.forEach((element) {
      if (element.weekDay == DateTime.now().weekday) {
        openingHourToday = element;
        return;
      }
    });
    return openingHourToday != null;
  }

  bool isTomorowOpen() {
    var tomorow = DateTime.now().add(Duration(days: 1));
    OpeningHour openingHourToday;
    openHours.forEach((element) {
      if (element.weekDay == tomorow.weekday) {
        openingHourToday = element;
        return;
      }
    });
    return openingHourToday != null;
  }

  String getOpenCloseTime({DateTime day}) {
    var open = openTime(day: day);
    var clouse = closeTime(day: day);
    return open.contains("Fechado") ? "Fechado" : "$open - $clouse";
  }

  String openTime({DateTime day}) {
    OpeningHour openingHourToday;
    openHours.forEach((element) {
      if (element.weekDay == (day?.weekday ?? DateTime.now().weekday)) {
        openingHourToday = element;
        return;
      }
    });
    if (openingHourToday == null) {
      // Nao abre no dia
      return "Fechado";
    }
    var open = DateUtil.todayTime(
        openingHourToday.openHour, openingHourToday.openMinute);
    String hour = open.hour < 10 ? "0${open.hour}" : open.hour.toString();
    String minutes =
        open.minute < 10 ? "0${open.minute}" : open.minute.toString();
    return "${hour}:${minutes}h";
  }

  String closeTime({DateTime day}) {
    OpeningHour openingHourToday;
    openHours.forEach((element) {
      if (element.weekDay == (day?.weekday ?? DateTime.now().weekday)) {
        openingHourToday = element;
        return;
      }
    });
    if (openingHourToday == null) {
      // Nao abre no dia
      return "Fechado";
    }
    var close = DateUtil.todayTime(
        openingHourToday.closeHour, openingHourToday.closeMinute);
    String hour = close.hour < 10 ? "0${close.hour}" : close.hour.toString();
    String minutes =
        close.minute < 10 ? "0${close.minute}" : close.minute.toString();
    return "${hour}:${minutes}h";
  }

  String getOpenTime(DateTime date) {
    OpeningHour openingHourToday;
    openHours.forEach((element) {
      if (element.weekDay == date.weekday) {
        openingHourToday = element;
        return;
      }
    });
    if (openingHourToday == null) {
      // Nao abre no dia
      return "Fechado";
    }

    var open = DateUtil.todayTime(
        openingHourToday.openHour, openingHourToday.openMinute);
    var close = DateUtil.todayTime(
        openingHourToday.closeHour, openingHourToday.closeMinute);

    //print("Agora ${date}");
    //print("Abre ${open}");
    //print("Fecha ${close}");

    if (close.isBefore(open)) {
      close = close.add(Duration(days: 1));
    }

    if (date.isAfter(open) && date.isBefore(close)) {
      return null; // Aberto
    } else {
      if (date.isAfter(close)) {
        return "Fechado";
      }
    }

    String hora = open.hour < 10 ? "0${open.hour}" : open.hour.toString();
    String minutos =
        open.minute < 10 ? "0${open.minute}" : open.minute.toString();
    return "Abre hoje às ${hora}:${minutos}h";
  }
}
