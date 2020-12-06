import 'package:flutter/material.dart';

TextStyle fontTitle(context, {double size, Color color, bool bold = false}) {
  return Theme.of(context).textTheme.headline4.copyWith(
        fontSize: size ?? null,
        color: color ?? null,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      );
}

TextStyle fontSubtitle(context, {double size, Color color, bool bold = false}) {
  return Theme.of(context).textTheme.headline5.copyWith(
        fontSize: size ?? null,
        color: color ?? null,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      );
}

TextStyle fontMessage(context, {double size, Color color, bool bold = false}) {
  return Theme.of(context).textTheme.headline6.copyWith(
        fontSize: size ?? null,
        color: color ?? null,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      );
}
