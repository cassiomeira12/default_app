import 'package:flutter/material.dart';

import '../../styles/font_style.dart';

class LightButton extends StatelessWidget {
  final Alignment alignment;
  final String text;
  final VoidCallback onPressed;

  const LightButton({
    this.alignment,
    this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: FlatButton(
          child: Text(
            text,
            style: fontButton(context),
          ),
          onPressed: onPressed),
    );
  }
}
