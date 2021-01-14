import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/components/image_network/image_network_widget.dart';
import 'package:default_app/app/modules/home/components/card_team.dart';
import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_controller.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final controller = Get.put(HomeController());

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
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.deliverymuch.com.br/headertop.3a31d7985746a893c26c.jpg'),
              ),
            ),
          ),
          team(),
          partners(),
          storeDownloads(),
          //plans(),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget team() {
    return Container(
      //color: Colors.lightBlueAccent,
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Nossos Time",
              style: fontTitle(context),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 350,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  CardTeam(
                    width: 250,
                    height: 200,
                    url:
                        'https://navan-agendamentos.web.app/img/team/cassio.jpg',
                    title: 'Cássio Meira Silva',
                    message: 'Desenvolvedor',
                    facebook: 'https://www.facebook.com/cassiomeira12/',
                    instagram: 'https://www.instagram.com/cassio.meira12/',
                    linkedin:
                        'https://www.linkedin.com/in/c%C3%A1ssio-meira-silva-6177b8192/',
                  ),
                  CardTeam(
                    width: 250,
                    height: 200,
                    url:
                        'https://pps.whatsapp.net/v/t61.24694-24/127242018_886859225390333_3120281497881011353_n.jpg?oh=9a42255ec8b2cd77144eb0e29aa24665&oe=5FE757D3',
                    title: 'Helivelton Carlos',
                    message: 'Marketing',
                    instagram: 'https://www.instagram.com/h_.carlos/',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget partners() {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Nossos Parceiros",
            style: fontTitle(context),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 350,
          child: Center(
            child: CustomFutureBuilder(
              future: controller.listCompanies(),
              builder: (context, snapshot) {
                List list = List.from(snapshot.data);
                return ListView.builder(
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: ImageNetworkWidget(
                            url: list[index]['logoURL'],
                            size: 220,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${list[index]['name']}",
                          overflow: TextOverflow.ellipsis,
                          style: fontTitle(context, size: 20, bold: true),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget plans() {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Nossos Planos",
            style: fontTitle(context),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 350,
          child: Center(
            child: CustomFutureBuilder(
              future: controller.listPlans(),
              builder: (context, snapshot) {
                List list = List.from(snapshot.data);
                return ListView.builder(
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      title: list[index]['name'],
                      message: list[index]['description'],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget storeDownloads() {
    return Container(
      //color: Color(0xFFeff5f5),
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Baixe agora",
            style: fontTitle(context),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Baixe o aplicativo Kideliver e peça comida de onde estiver",
              textAlign: TextAlign.center,
              style: fontMessage(context),
            ),
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width > 600
              //       ? 200
              //       : MediaQuery.of(context).size.width / 3,
              //   child: InkWell(
              //     child: Image.asset("assets/images/app_store.png"),
              //     onTap: () async {
              //       var url =
              //           'https://play.google.com/store/apps/details?id=com.navan.kideliver';
              //       if (await canLaunch(url)) {
              //         await launch(url);
              //       }
              //     },
              //   ),
              // ),r
              //SizedBox(width: 20),
              Container(
                width: MediaQuery.of(context).size.width > 600
                    ? null
                    : MediaQuery.of(context).size.width / 3,
                child: InkWell(
                  child: Image.asset("assets/images/play_store.png"),
                  onTap: () async {
                    var url =
                        'https://play.google.com/store/apps/details?id=com.navan.kideliver';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
