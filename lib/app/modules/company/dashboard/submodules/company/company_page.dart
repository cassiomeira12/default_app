import 'package:default_app/app/components/future_builder/custom_future_builder.dart';
import 'package:default_app/app/components/image_network/image_network_widget.dart';
import 'package:default_app/app/modules/company/dashboard/dashboard_controller.dart';
import 'package:default_app/app/shared/models/company/company.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final controller = Get.find<DashBoardController>();

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
                  child: CustomFutureBuilder(
                    future: controller.getCompanyFromAdmin(),
                    builder: (context, snapshot) {
                      var company = snapshot.data as Company;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageNetworkWidget(
                            url: company.logoURL,
                            size: 200,
                          ),
                          Text(
                            "${company.name}",
                            style: fontTitle(context),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              // Card(
              //   elevation: 5,
              //   child: Container(
              //     margin: EdgeInsets.all(20),
              //     width: 300,
              //     child: CustomFutureBuilder(
              //       future: controller.getCompanyFromAdmin(),
              //       builder: (context, snapshot) {
              //         List<dynamic> list =
              //             List.from(snapshot.data['openHours']);
              //         return Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Text(
              //               "Hoje: Fechado ",
              //               style: fontSubtitle(context),
              //             ),
              //             Text(
              //               "Abre hoje às 18:00h",
              //               style: fontSubtitle(context),
              //             ),
              //             SizedBox(height: 10),
              //             Wrap(
              //               spacing: 10,
              //               runSpacing: 10,
              //               crossAxisAlignment: WrapCrossAlignment.center,
              //               children: list.map((e) {
              //                 return Card(
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           Icon(Icons.calendar_today),
              //                           Text(
              //                             "Segunda",
              //                             style: fontMessage(context, size: 18),
              //                           ),
              //                         ],
              //                       ),
              //                       Text(
              //                         "Abre às 06:00h",
              //                         style: fontMessage(context, size: 18),
              //                       ),
              //                       Text(
              //                         "Fecha às 23:59h",
              //                         style: fontMessage(context, size: 18),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               }).toList(),
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
          // Container(
          //   margin: EdgeInsets.all(20),
          //   width: 100,
          //   height: 400,
          //   color: Colors.red,
          // ),
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
