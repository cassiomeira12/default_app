import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/styles/font_style.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre o $APP_NAME",
            style: fontTitle(context),
          ),
          SizedBox(height: 50),
          Text(
            "Nosso aplicativo",
            style: fontSubtitle(context),
          ),
          SizedBox(height: 50),
          Text(
            "Tudo começou com um sonho, na verdade um anseio de trazer para Macaúbas e região uma novidade. Algo que já é muito comum em medias e grandes cidades, um aplicativo de delivery de comida. \n\n\nUm projeto audacioso e desafiador, mas a covicção e o desejo de ajudar as pessoas era maior, assim como os empresários da nossa região.",
            style: fontMessage(context),
          ),
          SizedBox(height: 50),
          Text(
            "Nossa Missão",
            style: fontSubtitle(context),
          ),
          SizedBox(height: 50),
          Text(
            "Nossa missão é ajudar os empresários de Macaúbas e região a melhorar o seus posicionamento e imagem frente as redes sociais, além de aumentar o alcance de seus produtos, convertendo isso em vendas e consequentemente em mais lucro.",
            style: fontMessage(context),
          ),
          SizedBox(height: 50),
          // Text(
          //   "Nossa equipe",
          //   style: fontSubtitle(context),
          // ),
          // SizedBox(height: 50),
          // Text(
          //   "O WhatsApp foi fundado por Jan Koum e Brian Acton que, juntos, passaram quase 20 anos no Yahoo. O WhatsApp juntou-se ao Facebook em 2014, porém continua operando como um aplicativo independente e com o foco direcionado em construir um serviço de mensagens que seja rápido e que funcione em qualquer lugar do mundo.",
          //   style: fontMessage(context),
          // ),
        ],
      ),
    );
  }
}
