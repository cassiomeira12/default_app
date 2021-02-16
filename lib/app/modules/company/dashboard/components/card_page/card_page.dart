import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final Widget child;

  const CardPage({Key key, this.child}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 990
          ? MediaQuery.of(context).size.width / 1.04
          : MediaQuery.of(context).size.width / 1.50,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 1.2,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: widget.child,
        ),
      ),
    );
  }
}
