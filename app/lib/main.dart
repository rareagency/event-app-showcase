import 'package:eventapp/app.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event app demo',
      home: App(),

      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue[700],
        unselectedWidgetColor: Colors.grey[400],
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),

        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.blue[700],
          )
        ),
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
          body1: TextStyle(
            color: Colors.grey[900]
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
