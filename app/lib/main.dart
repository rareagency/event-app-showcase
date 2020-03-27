import 'package:eventapp/app.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event app demo',
      home: App(),
      theme: ThemeData.light().copyWith(
          accentColor: Colors.blue[700],
          unselectedWidgetColor: Colors.grey[400],
          cursorColor: Colors.grey[500],
          iconTheme: IconThemeData(
            color: Colors.grey[600],
          ),
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              letterSpacing: -1,
            ),
            body1: TextStyle(
              fontFamily: 'Inter',
              color: Colors.grey[900],
              letterSpacing: -0.5,
            ),
            body2: TextStyle(
              fontFamily: 'Inter',
              color: Colors.grey[700],
              letterSpacing: -0.5,
            ),
          )),
    );
  }
}

void main() => runApp(MyApp());
