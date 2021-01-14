import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontTitle(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline4,
    fontSize: size,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle fontSubtitle(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline5,
    fontSize: size,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle fontMessage(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline6,
    fontSize: size,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle fontButton(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline6,
    fontSize: size ?? 18,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle fontField(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline6,
    fontSize: size ?? 18,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}
