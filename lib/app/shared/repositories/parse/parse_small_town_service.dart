import 'base_parse_service.dart';

class ParseSmallTownService {
  var service = BaseParseService("SmallTown");

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
    return service.list();
  }
}
