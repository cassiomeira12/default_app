import 'dart:io';

import 'package:default_app/app/shared/repositories/parse/base_parse_service.dart';
import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseCompanyService {
  var service = BaseParseService('Company');

  create(item) async {
    // return await service.create(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  read(item) async {
    // return await service.read(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  update(item) async {
    // return await service.update(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  delete(item) async {
    // return await service.delete(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  findBy(String field, value) async {
    // return await service.findBy(field, value).then((value) {
    //   if (_view != null) _view.listSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  listCompanies() async {
    var dio = Dio();
    var response = await dio.post(
      "${GlobalConfiguration().appConfig['SERVER_URL']}functions/companies",
      options: RequestOptions(
        headers: {
          'X-Parse-Application-Id': GlobalConfiguration().appConfig['APP_ID'],
          'X-Parse-REST-API-Key':
              GlobalConfiguration().appConfig['REST_API_KEY'],
        },
      ),
    );
    return response.data['result'];
  }

  list() {
    return service.list().catchError((error) {
      return throw error.message;
    });
  }

  listFromCity(String id) async {
    // return await service.listFromCity(id).then((value) {
    //   if (_view != null) _view.listSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  listFromSmallTown(String id) async {
    // return await service.listFromSmallTown(id).then((value) {
    //   if (_view != null) _view.listSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  userHasCompany(user) async {
    var queryBuilder = QueryBuilder(ParseObject('AdminCompany'));
    queryBuilder.whereEqualTo("user", user.toPointer());
    return await queryBuilder.query().then((value) {
      if (value.success) {
        return value.results != null;
      } else {
        throw value.error;
      }
    });
  }

  Map<String, dynamic> slipIncludes(List<String> inclues) {
    Map map = Map<String, dynamic>();
    inclues.forEach((element) {
      element.split('.').forEach((element) {
        map[element] = null;
      });
    });
    return map;
  }

  getCompanyFromAdmin(user) async {
    var includes = [
      "company.address",
      "company.address.city",
      "company.address.smallTown",
      "company.address.smallTown.city",
      "company.deliveryStatus",
      "company.pickupStatus",
    ];

    var query = QueryBuilder<ParseObject>(ParseObject('AdminCompany'))
      ..whereEqualTo("user", user.toPointer())
      ..keysToReturn(["company"])
      ..includeObject(includes);

    return service.query(query, includes: includes).then((value) {
      return value[0]['company'];
    });
  }

  changeLogoPhoto(File file) async {
    // return await service.changeLogoPhoto(file).then((value) {
    //   if (_view != null) _view.listSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  changeBannerPhoto(File file) async {
    // return await service.changeBannerPhoto(file).then((value) {
    //   if (_view != null) _view.listSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  createAdminCompany(String userId, String companyId) async {
    // return await service.createAdminCompany(userId, companyId).then((value) {
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }
}
