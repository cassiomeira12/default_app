import 'base_parse_service.dart';

class ParseUserService {
  var service = BaseParseService('_User');

  Future create(item) async {
    return service.create(item);
  }

  read(item) async {
    return service.read(item);
  }

  update(item) async {
    return service.update(item);
  }

  delete(item) async {
    return service.delete(item);
  }

  findBy(String field, value) async {
    return service.findBy(field, value);
  }

  list() {
    return service.list();
  }
}
