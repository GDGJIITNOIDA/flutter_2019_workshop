import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Workshop",
      theme: new ThemeData(
        primaryColor: Colors.lightGreen,
        primaryColorDark: Colors.lightGreenAccent
      ),
      home: HomeScreen(),
    );
  }
}
