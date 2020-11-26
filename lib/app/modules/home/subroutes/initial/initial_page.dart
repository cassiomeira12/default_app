import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:default_app/app/modules/home/subroutes/contact/contact_page.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    print("home init");
  }

  @override
  void dispose() {
    super.dispose();
    print("home dispose");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("History company"),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 2,
            height: 500,
            color: Colors.blue,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 400,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 100,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 300,
            color: Colors.black45,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 600,
            color: Colors.pink,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 200,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 200,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 200,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 200,
            color: Colors.red,
          ),
          ContactPage(),
          CopyRigth(),
        ],
      ),
    );
  }
}
