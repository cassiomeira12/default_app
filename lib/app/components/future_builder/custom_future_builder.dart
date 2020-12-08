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
            return Text(snapshot.error);
          } else {
            return CircularProgressIndicator();
          }
        } catch (error) {
          return Text("Error");
        }
      },
    );
  }
}
