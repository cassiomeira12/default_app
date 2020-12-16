import 'dart:io';

import 'package:default_app/app/shared/repositories/base_parse_service.dart';
import 'package:default_app/app/shared/repositories/parse_init.dart';
import 'package:dio/dio.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

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

  getCompanyFromAdmin(user) async {
    var query = QueryBuilder<ParseObject>(ParseObject('AdminCompany'))
      ..whereEqualTo("user", user.toPointer())
      ..keysToReturn(["company"])
      ..includeObject([
        "company.address",
        "company.address.city",
        "company.address.smallTown",
        "company.address.smallTown.city",
        "company.deliveryStatus",
        "company.pickupStatus"
      ]);

    return await query.query().then((value) async {
      if (value.success) {
        if (value.result == null) {
          return null;
        } else {
          var obj = value.result[0];

          var companyJson,
              addressJson,
              smallTownJson,
              cityJson,
              deliveryStatus,
              pickupStatus;

          companyJson = obj.toJson();

          try {
            companyJson = obj.get("company").toJson();
          } catch (error) {}
          try {
            addressJson = obj.get("company").get("address").toJson();
          } catch (error) {}
          try {
            cityJson = obj.get("company").get("address").get("city").toJson();
          } catch (error) {}
          try {
            smallTownJson =
                obj.get("company").get("address").get("smallTown").toJson();
          } catch (error) {}
          try {
            cityJson = obj
                .get("company")
                .get("address")
                .get("smallTown")
                .get("city")
                .toJson();
          } catch (error) {}
          try {
            deliveryStatus = obj.get("company").get("deliveryStatus").toJson();
          } catch (error) {}
          try {
            pickupStatus = obj.get("company").get("pickupStatus").toJson();
          } catch (error) {}

          smallTownJson == null
              ? addressJson["city"] = cityJson
              : smallTownJson["city"] = cityJson;
          addressJson["smallTown"] = smallTownJson;
          companyJson["address"] = addressJson;
          companyJson["deliveryStatus"] = deliveryStatus;
          companyJson["pickupStatus"] = pickupStatus;

          return companyJson;
        }
      } else {
        throw value.error;
      }
    }).catchError((error) {
      throw error;
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
