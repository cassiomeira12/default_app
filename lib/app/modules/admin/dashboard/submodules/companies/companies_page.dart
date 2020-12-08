import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:flutter/material.dart';

import 'companies_controller.dart';

class CompaniesPage extends StatefulWidget {
  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  var controller = CompaniesController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: CustomFutureBuilder(
              future: controller.list(),
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
        ],
      ),
    );
  }
}
