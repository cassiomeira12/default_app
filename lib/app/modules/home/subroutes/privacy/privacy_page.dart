import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlatButton(
          child: Text(
            APP_NAME,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onPressed: () => Get.toNamed('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 56,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              body(),
              CopyRigth(),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 5,
        top: 50,
        bottom: 100,
        right: MediaQuery.of(context).size.width / 5,
      ),
      child: Text(
          "ESTA POLÍTICA DE PRIVACIDADE ESTABELECE AS CONDIÇÕES DE TRATAMENTO DOS SEUS DADOS NECESSÁRIAS PARA A OPERAÇÃO DO APLICATIVO DA NAVAN E O FORNECIMENTO DOS SERVIÇOS DA NAVAN, INDISTINTAMENTE PARA MOTORISTAS E PASSAGEIROS. CASO VOCÊ NÃO CONCORDE COM ALGUMA DISPOSIÇÃO DESTA POLÍTICA DE PRIVACIDADE, VOCÊ NÃO DEVE UTILIZAR O APLICATIVO DA NAVAN E OS SERVIÇOS DA NAVAN. VOCÊ COMPREENDE E CONCORDA DE MANEIRA EXPRESSA QUE A NAVAN PODERÁ COLETAR, ARMAZENAR, PROCESSAR, ASSOCIAR, COMPARTILHAR, UTILIZAR, DIVULGAR OU DE OUTRO MODO TRATAR AS SUAS INFORMAÇÕES, INCLUINDO SEUS DADOS PESSOAIS, SOB QUALQUER DAS FORMAS E PARA TODAS AS FINALIDADES PREVISTAS NESTA POLÍTICA DE PRIVACIDADE."),
    );
  }
}
