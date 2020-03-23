import 'package:eventapp/app.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Event app demo',
  home: App(),
  theme: ThemeData(
    primaryColor: Colors.grey[800],
    cardColor: Colors.grey[200],
    hintColor: Colors.grey[550],
    backgroundColor: Colors.white,
    cursorColor: Colors.grey[800],
    bottomAppBarColor: Colors.grey[300],
    fontFamily: 'Inter',
  ),
));
