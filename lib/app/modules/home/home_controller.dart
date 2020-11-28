import 'package:default_app/app/shared/repositories/base_parse_service.dart';

class HomeController {
  void teste() async {
    var teste = BaseParseService('City');
    teste.list().then((value) {
      print(value);
    });
  }
}
