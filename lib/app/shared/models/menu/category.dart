import '../base_model.dart';
import 'product.dart';

class Category extends BaseModel<Category> {
  String name;
  List<Product> products;

  Category({this.name}) : super('Category') {
    products = List();
  }

  Category.fromMap(Map<dynamic, dynamic> map) : super('Category') {
    baseFromMap(map);
    name = map["name"];
    products = map["products"] == null
        ? List()
        : List.from(map["products"])
            .map<Product>((e) => Product.fromMap(e))
            .toList();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["products"] = products == null
        ? List()
        : products.map<Map>((e) => e.toMap()).toList();
    return map;
  }

  @override
  updateData(Category item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    products = item.products;
  }
}
