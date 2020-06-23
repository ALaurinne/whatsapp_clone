import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/HomePage.dart';

// based on: https://www.youtube.com/watch?v=GGiklXSnQ2s&t=1761s
// some elements from: https://www.youtube.com/watch?v=mbY0v5tuBF8,  https://www.youtube.com/watch?v=2Tyrofn6zPg, https://www.youtube.com/watch?v=xrwu3vDRL-0&t=17s

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
      ),
      darkTheme: ThemeData(
        primaryColor: primaryColor,
        brightness: Brightness.dark
      ),
    );
  }
}
