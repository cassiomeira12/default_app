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
      padding: EdgeInsets.only(top: 20, bottom: 20),
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
    );
  }
}
