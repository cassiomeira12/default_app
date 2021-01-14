import 'package:flutter/material.dart';

const brightness = Brightness.dark;

const primaryColor = Color(0xFFB40000);
const primaryColorLight = Color(0xFFFF5D5D);
const primaryColorDark = Color(0xFFB40000);
const accentColor = Color(0xFFFCA639);

const backgroundColor = Color(0xFFF5F5F5);
const errorColor = Colors.redAccent;

ThemeData darkTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[800],
    backgroundColor: Colors.grey[700],
    brightness: brightness,
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.grey[700],
      elevation: 5,
    ),
    // buttonTheme: new ButtonThemeData(
    //   buttonColor: Colors.orange,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    iconTheme: IconThemeData(
      color: Colors.white70,
    ),
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    //cardColor: Colors.white70,
    hintColor: Colors.white30,
    errorColor: errorColor,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    accentColor: accentColor,
    buttonColor: primaryColorDark,
    // fontFamily: 'Montserrat',
  );
}
