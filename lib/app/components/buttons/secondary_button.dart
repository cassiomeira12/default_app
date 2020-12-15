import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Widget child;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const SecondaryButton({
    this.text,
    this.width,
    this.height,
    this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
//      width: width ?? MediaQuery.of(context).size.width > 500
//          ? 500
//          : MediaQuery.of(context).size.width,
      //height: height ?? 50,
      child: RaisedButton(
        //elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //side: BorderSide(color: Theme.of(context).hintColor),
        ),
        color: Theme.of(context).backgroundColor,
        child: child == null
            ? Text(
                text,
                style: Theme.of(context).textTheme.body2,
              )
            : child,
        onPressed: onPressed,
      ),
    );
  }
}
