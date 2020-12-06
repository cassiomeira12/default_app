import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/style/font_style.dart';
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
      child: Column(
        children: [
          Container(
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
                  style: fontSubtitle(context, color: Colors.black87),
                ),
                SizedBox(height: 50),
                Text(
                  "Mais de dois bilhões de pessoas, em mais de 180 países, usam o WhatsApp1 para manter o contato com amigos e familiares, a qualquer hora ou lugar. O WhatsApp é gratuito2 e oferece um serviço de mensagens e chamadas simples, seguro e confiável para celulares em todo o mundo.",
                  style: fontMessage(context, color: Colors.black45),
                ),
                SizedBox(height: 50),
                Text(
                  "Nossa Missão",
                  style: fontSubtitle(context, color: Colors.black87),
                ),
                SizedBox(height: 50),
                Text(
                  "O WhatsApp surgiu como uma alternativa ao sistema de SMS e agora possibilita o envio e recebimento de diversos arquivos de mídia: textos, fotos, vídeos, documentos e localização, além de chamadas de voz. Alguns de seus momentos mais importantes são compartilhados no WhatsApp. Por essa razão, implementamos a criptografia de ponta a ponta no nosso aplicativo. Por trás de cada decisão está o nosso desejo de possibilitar que as pessoas se comuniquem sem barreiras, em qualquer lugar do mundo.",
                  style: fontMessage(context, color: Colors.black45),
                ),
                SizedBox(height: 50),
                Text(
                  "Nossa equipe",
                  style: fontSubtitle(context, color: Colors.black87),
                ),
                SizedBox(height: 50),
                Text(
                  "O WhatsApp foi fundado por Jan Koum e Brian Acton que, juntos, passaram quase 20 anos no Yahoo. O WhatsApp juntou-se ao Facebook em 2014, porém continua operando como um aplicativo independente e com o foco direcionado em construir um serviço de mensagens que seja rápido e que funcione em qualquer lugar do mundo.",
                  style: fontMessage(context, color: Colors.black45),
                ),
              ],
            ),
          ),
          CopyRigth(),
        ],
      ),
    );
  }
}
