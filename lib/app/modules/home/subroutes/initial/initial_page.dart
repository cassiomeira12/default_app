import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.deliverymuch.com.br/headertop.3a31d7985746a893c26c.jpg'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 5,
                height: 250,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 5,
                height: 250,
                color: Colors.pink,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 5,
                height: 250,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 5,
                height: 250,
                color: Colors.red,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.red,
          ),
          //ContactPage(),
          CopyRigth(),
        ],
      ),
    );
  }
}
