import 'package:flutter/material.dart';
import 'screens/calculator.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: "calculator",
      home: Calculator(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.,
          primaryColor: Colors.green[300],
          accentColor: Colors.greenAccent[600],
          textTheme: TextTheme(
              subtitle1: TextStyle(fontStyle: FontStyle.italic),
              bodyText1: TextStyle(fontStyle: FontStyle.italic))),
    );
  }
}
