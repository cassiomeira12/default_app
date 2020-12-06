import 'package:flutter/material.dart';

class MenusPage extends StatefulWidget {
  @override
  _MenusPageState createState() => _MenusPageState();
}

class _MenusPageState extends State<MenusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Container(
              width: 300,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome cardápio"),
                  Text("Nome cardápio"),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
