import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontTitle(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline4,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle fontSubtitle(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline5,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle fontMessage(context, {double size, Color color, bool bold = false}) {
  return GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline6,
    color: color ?? null,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );
}
