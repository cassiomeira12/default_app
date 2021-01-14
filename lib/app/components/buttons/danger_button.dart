import 'package:flutter/material.dart';

import '../../styles/font_style.dart';

class DangerButton extends StatelessWidget {
  final String text;
  final Widget child;
  final VoidCallback onPressed;

  const DangerButton({
    this.text,
    this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width > 500
      //     ? 500
      //     : MediaQuery.of(context).size.width,
      // height: 50.0,
      child: RaisedButton(
          //elevation: 5.0,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Theme.of(context).errorColor,
          child: child == null
              ? Text(
                  text,
                  style: fontButton(
                    context,
                    color: Colors.white,
                    bold: true,
                  ),
                )
              : child,
          onPressed: onPressed),
    );
  }
}
