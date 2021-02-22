import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:global_configuration/global_configuration.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = GlobalConfiguration().appConfig['SERVER_URL'];
    options.headers = {
      'X-Parse-Application-Id': GlobalConfiguration().appConfig['APP_ID'],
      'X-Parse-REST-API-Key': GlobalConfiguration().appConfig['REST_API_KEY'],
    };
    //options.connectTimeout = 10000;
    //options.receiveTimeout = 5000;
    interceptors.add(
      InterceptorsWrapper(
        //onRequest: (RequestOptions options) => requestInterceptor(options),
        //onResponse: (Response response) => responseInterceptor(response),
        onError: (DioError dioError) => print(dioError),
      ),
    );
  }
}
