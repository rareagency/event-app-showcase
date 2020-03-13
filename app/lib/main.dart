import 'package:eventapp/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Event app demo',
        home: Login(),
        theme: ThemeData(
            primaryColor: Colors.grey[800],
            cardColor: Colors.grey[200],
            hintColor: Colors.grey[550],
            backgroundColor: Colors.white,
            fontFamily: 'Inter',
    ));
  }
}

void main() => runApp(App());
