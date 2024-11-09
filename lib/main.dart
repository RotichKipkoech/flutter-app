// main.dart
import 'package:flutter/material.dart';
import 'page_transition.dart';  // Page transition screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageTransitionExample(), // Navigate to the page transition screen first
    );
  }
}