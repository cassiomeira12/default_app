import '../../models/company/company.dart';
import '../base_model.dart';
import 'category.dart';

class Menu extends BaseModel<Menu> {
  Company company;
  List<Category> categories;

  Menu() : super('Menu');

  Menu.fromMap(Map<String, dynamic>  map) : super('Menu') {
    baseFromMap(map);
    company = Company.fromMap(map["company"]);
    categories = map["categories"] == null ? null : List.from(map["categories"]).map<Category>((e) => Category.fromMap(e)).toList();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["company"] = company.toPointer();
    map["categories"] = categories == null ? null : categories.map<Map>((e) => e.toMap()).toList();
    return map;
  }

  @override
  updateData(Menu item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    company = item.company;
    categories = item.categories;
  }

}