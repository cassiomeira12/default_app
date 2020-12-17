import 'package:default_app/app/shared/repositories/parse/parse_init.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = ParseInit.serverUrl;
    options.headers = {
      'X-Parse-Application-Id': ParseInit.appId,
      'X-Parse-REST-API-Key': ParseInit.restApiKet,
    };
    options.connectTimeout = 10000;
    options.receiveTimeout = 5000;
    //interceptors.add();
  }
}
