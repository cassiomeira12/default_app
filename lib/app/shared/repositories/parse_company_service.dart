import 'package:default_app/app/shared/repositories/base_parse_service.dart';
import 'package:default_app/app/shared/repositories/parse_init.dart';
import 'package:dio/dio.dart';

class ParseCompanyService {
  var service = BaseParseService('Company');

  listCompanies() async {
    var dio = Dio();
    var response = await dio.post(
      "${ParseInit.serverUrl}functions/companies",
      options: Options(
        headers: {
          'X-Parse-Application-Id': ParseInit.appId,
          'X-Parse-REST-API-Key': ParseInit.restApiKet,
        },
      ),
    );
    return response.data['result'];
  }

  list() {
    return service.list();
  }
}
