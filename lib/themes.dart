// themes.dart
import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.blueAccent,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue, // Apply global button color
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 16, color: Colors.black),
    bodyText2: TextStyle(fontSize: 14, color: Colors.black54),
    headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
  ),
);