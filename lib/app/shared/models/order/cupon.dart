import '../../models/base_user.dart';
import '../../models/company/company.dart';
import '../base_model.dart';

class Cupon extends BaseModel<Cupon> {
  String code, description;
  Company companyProvider;
  BaseUser userProvider;
  List<String> companiesRequired;
  List<String> usersRequired;
  double companyMoneyDiscount, appMoneyDiscount;
  int companyPercentDiscount, appPercentDiscount;
  int limit;
  DateTime dateLimit;
  double minValue, maxValue;

  Cupon() : super('Cupon');

  Cupon.fromMap(Map<dynamic, dynamic> map) : super('Cupon') {
    baseFromMap(map);
    code = map["code"];
    description = map["description"];
    limit = map["limit"] == null ? 0 : (map["limit"] as num).toInt();
    dateLimit = map["dateLimit"] == null
        ? null
        : DateTime.parse(map["dateLimit"]["iso"]).toLocal();
    companyMoneyDiscount = map["companyMoneyDiscount"] == null
        ? 0
        : (map["companyMoneyDiscount"] as num).toDouble();
    appMoneyDiscount = map["appMoneyDiscount"] == null
        ? 0
        : (map["appMoneyDiscount"] as num).toDouble();
    companyPercentDiscount = map["companyPercentDiscount"] == null
        ? 0
        : (map["companyPercentDiscount"] as num).toInt();
    appPercentDiscount = map["appPercentDiscount"] == null
        ? 0
        : (map["appPercentDiscount"] as num).toInt();
    companyProvider = map["companyProvider"] == null
        ? null
        : Company.fromMap(map["companyProvider"]);
    userProvider = map["userProvider"] == null
        ? null
        : BaseUser.fromMap(map["userProvider"]);
    companiesRequired = map["companiesRequired"] == null
        ? List()
        : List.from(map["companiesRequired"]);
    usersRequired =
        map["usersRequired"] == null ? List() : List.from(map["usersRequired"]);
    minValue =
        map["minValue"] == null ? 0 : (map["minValue"] as num).toDouble();
    maxValue =
        map["maxValue"] == null ? 0 : (map["maxValue"] as num).toDouble();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["code"] = code;
    map["description"] = description;
    map["limit"] = limit;
    map["dateLimit"] = dateLimit == null ? null : dateLimit.toString();
    map["companyMoneyDiscount"] = companyMoneyDiscount;
    map["appMoneyDiscount"] = appMoneyDiscount;
    map["companyPercentDiscount"] = companyPercentDiscount;
    map["appPercentDiscount"] = appPercentDiscount;
    map["companyProvider"] =
        companyProvider == null ? null : companyProvider.toPointer();
    map["userProvider"] =
        userProvider == null ? null : userProvider.toPointer();
    map["companiesRequired"] =
        companiesRequired == null ? List() : companiesRequired;
    map["usersRequired"] = usersRequired == null ? List() : usersRequired;
    map["minValue"] = minValue;
    map["maxValue"] = maxValue;
    return map;
  }

  @override
  void updateData(Cupon item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    code = item.code;
    description = item.description;
    limit = item.limit;
    dateLimit = item.dateLimit;
    companyMoneyDiscount = item.companyMoneyDiscount;
    appMoneyDiscount = item.appMoneyDiscount;
    companyPercentDiscount = item.appPercentDiscount;
    appPercentDiscount = item.appPercentDiscount;
    companyProvider = item.companyProvider;
    userProvider = item.userProvider;
    companiesRequired = item.companiesRequired;
    usersRequired = item.usersRequired;
    minValue = item.minValue;
    maxValue = item.maxValue;
  }

  int getPercentDiscount() => companyPercentDiscount + appPercentDiscount;

  double getMoneyDiscount() => companyMoneyDiscount + appMoneyDiscount;

  double calcPercentDiscount(double value) {
    return value != null
        ? value * (getPercentDiscount()) / 100
        : getPercentDiscount().toDouble();
  }

  String getDiscount() {
    String moneyDicount = getMoneyDiscount() != 0
        ? "-R\$: ${getMoneyDiscount().toStringAsFixed(2)}"
        : "";
    String percentDiscount =
        getPercentDiscount() != 0 ? "-${getPercentDiscount()}%" : "";
    return "$percentDiscount $moneyDicount";
  }
}
