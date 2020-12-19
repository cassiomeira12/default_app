import 'package:default_app/app/shared/repositories/parse/parse_init.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BaseParseService {
  String className;

  BaseParseService(String path) {
    this.className = path;
  }

  ParseObject getObject() {
    return ParseObject(className);
  }

  Future<Map<String, dynamic>> create(Map<String, dynamic> data) async {
    await ParseInit.init();
    var object = ParseObject(className);
//    item.toMap().forEach((key, value) {
//      object.set(key, value);
//    });
    return await object.create().then((value) {
      return value.success ? value.result.toJson() : throw value.error;
    });
  }

  Future<Map<String, dynamic>> read(Map<String, dynamic> data) async {
    await ParseInit.init();
    var object = ParseObject(className);
    return await object.getObject(data['id']).then((value) {
      return value.success ? value.result.toJson() : throw value.error;
    });
  }

  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async {
    await ParseInit.init();
    var object = ParseObject(className);
    object.objectId = data['objectId'];
    data.forEach((key, value) {
      object.set(key, value);
    });
    return await object.update().then((value) {
      return value.success ? value.result.toJson() : throw value.error;
    });
  }

  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async {
    await ParseInit.init();
    var object = ParseObject(className);
    return await object.delete(id: data['id'], path: '').then((value) {
      return value.success ? data : throw value.error;
    });
  }

  Future<List<Map<String, dynamic>>> findBy(String field, value) async {
    await ParseInit.init();
    var object = ParseObject(className);
    var queryBuilder = QueryBuilder(object);
    queryBuilder.whereEqualTo(field, value);
    queryBuilder.orderByDescending("createdAt");
    return await queryBuilder.query().then((value) {
      if (value.success) {
        if (value.result == null) {
          return List();
        } else {
          List<ParseObject> list = value.result;
          return list.map<Map<String, dynamic>>((e) => e.toJson()).toList();
        }
      } else {
        return throw value.error;
      }
    });
  }

  Future<List<Map<String, dynamic>>> list() async {
    await ParseInit.init();
    var object = ParseObject(className);
    return await object.getAll().then((value) {
      if (value.success) {
        if (value.result == null) {
          return List();
        } else {
          List<ParseObject> list = value.result;
          return list.map<Map<String, dynamic>>((e) => e.toJson()).toList();
        }
      } else {
        return throw value.error;
      }
    });
  }

  Future<List<Map<String, dynamic>>> query(query, {includes}) async {
    await ParseInit.init();
    return await query.query().then((value) {
      if (value.success) {
        if (value.result == null) {
          return List<Map<String, dynamic>>();
        } else {
          List<ParseObject> listObj = value.result;

          var list = listObj.map<Map<String, dynamic>>((e) {
            var objectJson = e.toJson();

            if (includes != null) {
              for (var include in includes) {
                if (e.get(include) != null) {
                  var json = e.get(include).toJson();
                  objectJson[include] = json;
                }
              }
            }

            return objectJson;
          }).toList();

          return list;
          //return list.map<Map<String, dynamic>>((e) => e.toJson()).toList();
        }
      } else {
        return throw value.error;
      }
    });
  }
}
