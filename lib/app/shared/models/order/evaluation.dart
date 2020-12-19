import '../base_model.dart';

class Evaluation extends BaseModel<Evaluation> {
  int stars;
  String comment;

  Evaluation() : super('Evaluation');

  Evaluation.fromMap(Map<dynamic, dynamic>  map) : super('Evaluation') {
    baseFromMap(map);
    stars = map["stars"] as int;
    comment = map["comment"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["stars"] = stars;
    map["comment"] = comment;
    return map;
  }

  @override
  updateData(Evaluation item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    stars = item.stars;
    comment = item.comment;
  }

}