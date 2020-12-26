import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future future;
  final AsyncWidgetBuilder builder;

  CustomFutureBuilder({this.future, this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        try {
          if (snapshot.hasData) {
            return builder(context, snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } catch (error) {
          return Center(
            child: Text(error?.toString() ?? "Ops! ocorreu um erro"),
          );
        }
      },
    );
  }
}
