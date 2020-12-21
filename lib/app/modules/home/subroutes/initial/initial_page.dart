import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/modules/home/components/card_team.dart';
import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

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
                  // CardTeam(
                  //   width: 250,
                  //   height: 200,
                  //   url:
                  //       'https://navan-agendamentos.web.app/img/team/cassio.jpg',
                  //   title: 'Helivelton Carlos',
                  //   message: 'Marketing',
                  // ),
                ],
              ),
            ),
          ),
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
                      return CustomCard(
                        height: 200,
                        title: "${list[index]['name']}",
                        url: list[index]['logoURL'],
                      );
                    },
                  );
                },
              ),
            ),
          ),
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
      ),
    );
  }
}
