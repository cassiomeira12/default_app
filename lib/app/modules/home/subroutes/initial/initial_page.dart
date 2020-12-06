import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/modules/home/subroutes/initial/initial_controller.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var controller = InitialController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: const EdgeInsets.all(10),
            child: Text(
              "Nossos parceiros",
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Nossos Planos",
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
                  CustomCard(
                    title: "Plano Gratuito",
                    message: "Plano gratuito, 30 dias de teste",
                  ),
                  CustomCard(
                    title: "Plano Mensal",
                    message: "Plano com mensal por apenas R\$: 30,00",
                  ),
                  CustomCard(
                    title: "Plano Semestral",
                    message: "Plano com semestral por apenas R\$: 150,00",
                  ),
                  CustomCard(
                    title: "Plano Anual",
                    message: "Plano com anual por apenas R\$: 240,00",
                  ),
                ],
              ),
            ),
          ),
          CopyRigth(),
        ],
      ),
    );
  }
}
