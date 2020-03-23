import 'package:eventapp/app.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event app demo',
      home: App(),

      theme: ThemeData.light().copyWith(
        unselectedWidgetColor: Colors.grey[400],
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black
          ),
          body2: TextStyle(
            color: Colors.grey[700]
          )
        )
      ),
    );
  }
}

void main() => runApp(MyApp());
