import 'package:default_app/app/shared/repositories/base_parse_service.dart';

class ParseCompanyService {
  var service = BaseParseService('Company');

  list() {
    return service.list();
  }
}
