import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ThemeMode> getTheme() async {
  var pref = await SharedPreferences.getInstance();
  var index = pref.getInt("theme");
  return index == null ? ThemeMode.system : ThemeMode.values[index];
}
