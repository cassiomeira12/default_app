import 'package:default_app/app/style/font_style.dart';
import 'package:flutter/material.dart';

import 'company_controller.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  var controller = CompanyController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            children: [
//              Container(
//                margin: EdgeInsets.all(20),
//                child: CustomFutureBuilder(
//                  future: controller.list(),
//                  builder: (context, data) {
//                    return CustomCard();
//                  },
//                ),
//              ),
              Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 300,
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        color: Colors.red,
                      ),
                      Text(
                        "Villa Pub",
                        style: fontTitle(context),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 300,
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hoje: Fechado ",
                        style: fontSubtitle(context),
                      ),
                      Text(
                        "Abre hoje às 18:00h",
                        style: fontSubtitle(context),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: [
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.calendar_today),
                                    Text("Segunda",
                                        style: fontMessage(context, size: 18)),
                                  ],
                                ),
                                Text("Abre às 06:00h",
                                    style: fontMessage(context, size: 18)),
                                Text("Fecha às 23:59h",
                                    style: fontMessage(context, size: 18)),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.calendar_today),
                                    Text("Segunda",
                                        style: fontMessage(context, size: 18)),
                                  ],
                                ),
                                Text("Abre às 06:00h",
                                    style: fontMessage(context, size: 18)),
                                Text("Fecha às 23:59h",
                                    style: fontMessage(context, size: 18)),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.calendar_today),
                                    Text("Segunda",
                                        style: fontMessage(context, size: 18)),
                                  ],
                                ),
                                Text("Abre às 06:00h",
                                    style: fontMessage(context, size: 18)),
                                Text("Fecha às 23:59h",
                                    style: fontMessage(context, size: 18)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
//          Container(
//            margin: EdgeInsets.all(20),
//            width: 100,
//            height: 400,
//            color: Colors.red,
//          ),
//          Container(
//            margin: EdgeInsets.all(20),
//            width: 100,
//            height: 400,
//            color: Colors.red,
//          ),
        ],
      ),
    );
  }
}
