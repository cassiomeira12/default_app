import '../base_model.dart';

class OpeningHour extends BaseModel<OpeningHour> {
  int weekDay;
  int openHour, openMinute;
  int closeHour, closeMinute;

  OpeningHour() : super('OpeningHour');

  OpeningHour.fromMap(Map<dynamic, dynamic>  map) : super('OpeningHour') {
    baseFromMap(map);
    weekDay = (map["weekDay"] as num).toInt();
    openHour = (map["openHour"] as num).toInt();
    openMinute = (map["openMinute"] as num).toInt();
    closeHour = (map["closeHour"] as num).toInt();
    closeMinute = (map["closeMinute"] as num).toInt();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["weekDay"] = weekDay;
    map["openHour"] = openHour;
    map["openMinute"] = openMinute;
    map["closeHour"] = closeHour;
    map["closeMinute"] = closeMinute;
    return map;
  }

  @override
  updateData(OpeningHour item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    weekDay = item.weekDay;
    openHour = item.openHour;
    openMinute = item.openMinute;
    closeHour = item.closeHour;
    closeMinute = item.closeMinute;
  }

  String getDay() {
    switch (weekDay) {
      case 1:
        return "Segunda";
      case 2:
        return "Terça";
      case 3:
        return "Quarta";
      case 4:
        return "Quinta";
      case 5:
        return "Sexta";
      case 6:
        return "Sábado";
      case 7:
        return "Domingo";
    }
  }

  String openTime() {
    String hora = openHour < 10 ? "0${openHour}" : openHour.toString();
    String minutos = openMinute < 10 ? "0${openMinute}" : openMinute.toString();
    return "${hora}:${minutos}h";
  }

  String closeTime() {
    String hora = closeHour < 10 ? "0${closeHour}" : closeHour.toString();
    String minutos = closeMinute < 10 ? "0${closeMinute}" : closeMinute.toString();
    return "${hora}:${minutos}h";
  }

}