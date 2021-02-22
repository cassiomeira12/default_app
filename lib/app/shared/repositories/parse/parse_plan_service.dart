import 'package:default_app/app/shared/repositories/parse/base_parse_service.dart';
import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';

class ParsePlanService {
  var service = BaseParseService('Plan');

  listPlans() async {
    var dio = Dio();
    var response = await dio.post(
      "${GlobalConfiguration().appConfig['SERVER_URL']}functions/plans",
      options: Options(
        headers: {
          'X-Parse-Application-Id': GlobalConfiguration().appConfig['APP_ID'],
          'X-Parse-REST-API-Key':
              GlobalConfiguration().appConfig['REST_API_KEY'],
        },
      ),
    );
    return response.data['result'];
  }
}
