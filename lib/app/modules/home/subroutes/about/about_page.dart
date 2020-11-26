import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
    print("about init");
  }

  @override
  void dispose() {
    super.dispose();
    print("about dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("About"),
    );
  }
}
