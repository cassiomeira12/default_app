import '../base_model.dart';

enum Type { CARD, MONEY, APP_PAYMENT, CASHBACK, PIC_PAY }

class TypePayment extends BaseModel<TypePayment> {
  String name;
  Type paymentType;
  int taxa; // 0 - 100 - Taxa pelo uso do aplicativo
  int maxInstallments; //Max prestação

  String url;

  TypePayment() : super('TypePayment') {
    taxa = 7;
    maxInstallments = 1;
  }

  TypePayment.fromMap(Map<dynamic, dynamic> map) : super('TypePayment') {
    baseFromMap(map);
    name = map["name"];
    var typeTemp = map["type"];
    Type.values.forEach((element) {
      if (element.toString().split('.').last == typeTemp) {
        paymentType = element;
        return;
      }
    });
    taxa = (map["taxa"] as num).toInt();
    maxInstallments = map["maxInstallments"] as int;
    url = map["url"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map["name"] = name;
    map["type"] = paymentType.toString().split('.').last;
    map["taxa"] = taxa;
    map["maxInstallments"] = maxInstallments;
    map["url"] = url;
    return map;
  }

  @override
  void updateData(TypePayment item) {
    id = item.id;
    objectId = item.objectId;
    createdAt = item.createdAt;
    updatedAt = item.updatedAt;

    name = item.name;
    type = item.type;
    taxa = item.taxa;
    maxInstallments = item.maxInstallments;
    url = item.url;
  }

  String getType() {
    switch (paymentType) {
      case Type.CARD:
        return "Cartão";
      case Type.MONEY:
        return "Dinheiro";
      case Type.APP_PAYMENT:
        return "Pagamento no Aplicativo";
      case Type.CASHBACK:
        return "Cashback";
      case Type.PIC_PAY:
        return "PicPay";
      default:
        return "";
    }
  }
}
