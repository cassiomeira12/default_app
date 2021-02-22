import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final double width;
  final Widget child;
  final Widget other;

  Responsive({
    this.child,
    this.width = 990,
    this.other,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 990 ? child : other;
  }
}
