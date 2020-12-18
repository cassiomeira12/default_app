import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'strings.dart';

const ERROR_NETWORK = "Verifique sua conexão com a internet";
const SOME_ERROR = "Ocorreu um erro";
const ERROR_ALREADY_EXISTS =
    "Error, já existe uma conta com esse email, tente novamente.";
const ERROR_LOGIN_PASSWORD = "Login ou Senha inválidos";

catchError({title, error}) {
  if (error.runtimeType == ParseError) {
    switch (error.code) {
      case -1:
        _showDialog(
          title: title ?? "Internet",
          message: ERROR_NETWORK,
        );
        break;
      case 101:
        _showDialog(
          title: "Erro ao fazer login",
          message: ERROR_LOGIN_PASSWORD,
        );
        break;
      default:
        _showDialog(
          message: error.message == null ? SOME_ERROR : error.message,
        );
    }
  } else {
    _showDialog(
      title: title ?? "Error",
      message: error.message == null ? SOME_ERROR : error.message,
    );
  }
}

_showDialog({title, message}) {
  showOkAlertDialog(
    context: Get.overlayContext,
    title: title,
    message: message,
    okLabel: OK,
    barrierDismissible: false,
  );
}
