import 'package:flutter/material.dart';

class ShapeRound extends StatelessWidget {
  final Widget child;

  ShapeRound({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 500
          ? 500
          : MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border.all(
          width: 1,
          color: Theme.of(context).hintColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}
