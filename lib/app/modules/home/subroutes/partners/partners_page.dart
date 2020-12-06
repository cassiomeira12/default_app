import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/modules/home/subroutes/partners/partners_controller.dart';
import 'package:flutter/material.dart';

class PartnersPage extends StatefulWidget {
  @override
  _PartnersPageState createState() => _PartnersPageState();
}

class _PartnersPageState extends State<PartnersPage> {
  var controller = PartnersController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: CustomFutureBuilder(
              future: controller.listCompanies(),
              builder: (context, snapshot) {
                List list = List.from(snapshot.data);
                return Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: list.map((e) {
                    return CustomCard(
                      title: "${e['name']}",
                      url: e['logoURL'],
                      height: 200,
                    );
                  }).toList(),
                );
              },
            ),
          ),
          CopyRigth(),
        ],
      ),
    );
  }
}
