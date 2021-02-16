import 'base_parse_service.dart';

class ParseStateService {
  var service = BaseParseService("State");

  Future<dynamic> create(dynamic item) async {
    return service.create(item);
  }

  Future<dynamic> read(dynamic item) {
    return service.read(item);
  }

  Future<dynamic> update(dynamic item) {
    return service.update(item);
  }

  Future<dynamic> delete(dynamic item) {
    return service.delete(item);
  }

  Future<List<dynamic>> findBy(String field, value) async {
    return service.findBy(field, value);
  }

  Future<List<dynamic>> list() {
    // var includes = [
    //   "country",
    // ];
    //
    // var query = QueryBuilder<ParseObject>(ParseObject('Country'))
    //   ..keysToReturn(["country"])
    //   ..includeObject(includes);
    //
    // return service.query(query, includes: includes).then((value) {
    //   return value[0]['country'];
    // });
    return service.list();
  }
}
