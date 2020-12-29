import 'base_parse_service.dart';

class ParseVersionAppService {
  var service = BaseParseService("VersionApp");

  Future<dynamic> create(dynamic item) async {
    // return service.create(item).then((response) {
    //   Cupon temp = Cupon();
    //   temp.updateData(item);
    //   temp.id = response["objectId"];
    //   temp.objectId = response["objectId"];
    //   temp.createdAt = DateTime.parse(response["createdAt"]).toLocal();
    //   return response == null ? null : temp;
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  Future<dynamic> read(dynamic item) {
    // return service.read(item).then((response) {
    //   return response == null ? null : Cupon.fromMap(response);
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  Future<dynamic> update(dynamic item) {
    return service.update(item);
    // return service.update(item).then((response) {
    //   //Cupon temp = Cupon();
    //   //temp.updateData(item);
    //   //temp.updatedAt = DateTime.parse(response["updatedAt"]).toLocal();
    //   //return response == null ? null : temp;
    // }).catchError((error) {
    //   throw Exception(error);
    // });
  }

  Future<dynamic> delete(dynamic item) {
    // return service.delete(item).then((response) {
    //   return response == null ? null : Cupon.fromMap(response);
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  Future<List<dynamic>> findBy(String field, value) async {
    // return service.findBy(field, value).then((response) {
    //   return response.isEmpty
    //       ? List<Cupon>()
    //       : response.map<Cupon>((item) => Cupon.fromMap(item)).toList();
    // }).catchError((error) {
    //   switch (error.code) {
    //     case -1:
    //       throw Exception(ERROR_NETWORK);
    //       break;
    //     default:
    //       throw Exception(error.message);
    //   }
    // });
  }

  list() {
    return service.list();
  }
}
