import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 250,
            color: Colors.pink,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Text(
                  'Message',
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            child: PrimaryButton(
              text: "Button",
              onPressed: () {
                //showDialogLogOut();
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
