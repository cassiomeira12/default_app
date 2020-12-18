import 'base_parse_service.dart';

class ParseSuperAdminService {
  var service = BaseParseService('SuperAdmin');

  create(item) async {
    return service.create(item);
    // return await service.create(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  read(item) async {
    return service.read(item);
    // return await service.read(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  update(item) async {
    return service.update(item);
    // return await service.update(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  delete(item) async {
    return service.delete(item);
    // return await service.delete(item).then((value) {
    //   if (_view != null) _view.onSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  findBy(String field, value) async {
    return service.findBy(field, value);
    // return await service.findBy(field, value).then((value) {
    //   if (_view != null) _view.listSuccess(value);
    //   return value;
    // }).catchError((error) {
    //   if (_view != null) _view.onFailure(error.message);
    //   return null;
    // });
  }

  list() {
    return service.list();
  }
}
