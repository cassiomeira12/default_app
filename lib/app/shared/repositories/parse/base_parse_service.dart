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
    var object = ParseObject(className);
    data.forEach((key, value) {
      object.set(key, value);
    });
    return await object.create().then((value) {
      return value.success ? value.result.toJson() : throw value.error;
    });
  }

  Future<Map<String, dynamic>> read(Map<String, dynamic> data) async {
    var object = ParseObject(className);
    return await object.getObject(data['objectId']).then((value) {
      return value.success ? value.result.toJson() : throw value.error;
    });
  }

  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async {
    var object = ParseObject(className);
    data.forEach((key, value) {
      object.set(key, value);
    });
    return await object.update().then((value) {
      return value.success ? value.result.toJson() : throw value.error;
    });
  }

  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async {
    var object = ParseObject(className);
    data.forEach((key, value) {
      object.set(key, value);
    });
    return await object.delete().then((value) {
      return value.success ? data : throw value.error;
    });
  }

  Future<List<Map<String, dynamic>>> findBy(String field, value) async {
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
    var object = ParseObject(className);
    var queryBuilder = QueryBuilder(object);
    queryBuilder.orderByDescending("createdAt");
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
    return await query.query().then((value) {
      if (value.success) {
        if (value.result == null) {
          return List<Map<String, dynamic>>();
        } else {
          List<ParseObject> listObj = value.result;

          var list = listObj.map<Map<String, dynamic>>((parseObject) {
            final mainObject = parseObject;
            Map<String, dynamic> objectJson = parseObject.toJson();

            if (includes != null) {
              var mapJson = _slipIncludes(includes);

              for (var includeList in includes) {
                ParseObject temp = mainObject;
                List<String> includeSplit = includeList.split(('.'));
                includeSplit.forEach((include) {
                  if (mapJson[include] == null && temp.get(include) != null) {
                    mapJson[include] = temp.get(include);
                    temp = temp.get(include);
                  } else {
                    temp = mapJson[include];
                  }
                });
              }

              String last;
              for (var includeList in includes) {
                List<String> includeSplit = includeList.split(('.'));
                includeSplit = includeSplit.reversed.toList();
                includeSplit.forEach((include) {
                  if (mapJson[include] != null) {
                    if (mapJson[include].runtimeType == ParseObject) {
                      mapJson[include] = mapJson[include].toJson();
                    }
                    if (last != null) {
                      mapJson[include][last] = mapJson[last];
                    }
                    last = include;
                  }
                });
              }

              objectJson[last] = mapJson[last];
            }

            return objectJson;
          }).toList();

          return list;
        }
      } else {
        return throw value.error;
      }
    });
  }

  Map<String, dynamic> _slipIncludes(List<String> inclues) {
    Map map = Map<String, dynamic>();
    inclues.forEach((element) {
      element.split('.').forEach((element) {
        map[element] = null;
      });
    });
    return map;
  }
}
