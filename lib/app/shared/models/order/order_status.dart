import '../base_model.dart';

class OrderStatus extends BaseModel<OrderStatus> {
  Status current;
  List<Status> values = List();

  OrderStatus() : super('OrderStatus');

  OrderStatus.fromMap(Map<dynamic, dynamic>  map) : super('OrderStatus') {
    baseFromMap(map);
    current = map["current"] == null ? null : Status.fromMap(map["current"]);
    values = map["values"] == null ?
      null :
      List.from(map["values"]).map<Status>((e) => Status.fromMap(e)).toList();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["current"] = current == null ? null : current.toMap();
    map["values"] = values == null ? null : values.map((e) => e.toMap()).toList();
    return map;
  }

  @override
  void updateData(OrderStatus item) {
    id = item.id;
    objectId = item.objectId;
    current = item.current;
    values = item.values;
  }

  bool isFirst() {
    return current.name == values.first.name;
  }

  bool isLast() {
    return current.name == values.last.name;
  }

  int getIndex(Status current) {
    int index = 0;
    for (var value in values) {
      if (current.name == value.name) {
        return index;
      }
      index++;
    }
    return -1;
  }

}

class Status extends BaseModel<Status> {
  String name;
  DateTime date;

  Status(this.name) : super('Status');

  Status.fromMap(Map<dynamic, dynamic>  map) : super('Status') {
    baseFromMap(map);
    name = map["name"];
    date = map["date"] == null ? null : DateTime.parse(map["date"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["date"] = date == null ? null : date.toString();
    return map;
  }

  @override
  void updateData(Status item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    date = item.date;
  }

}