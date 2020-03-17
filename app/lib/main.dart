import 'package:flutter/material.dart';
import 'package:eventapp/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Event app demo',
        home: Home(),
        theme: ThemeData(
            primaryColor: Colors.grey[800],
            cardColor: Colors.grey[200],
            hintColor: Colors.grey[550],
            backgroundColor: Colors.white,
            cursorColor: Colors.grey[800],
            bottomAppBarColor: Colors.grey[300],
            fontFamily: 'Inter',
    ));
  }
}

void main() => runApp(App());
