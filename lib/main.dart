import 'package:flutter/material.dart';
import 'package:weight_monitor_app/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Monitor App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E12),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomePage(),
    );
  }
}

