import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 250,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 250,
                color: Colors.pink,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 250,
                color: Colors.grey,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 400,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
