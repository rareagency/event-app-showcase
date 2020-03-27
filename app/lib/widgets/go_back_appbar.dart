import 'package:flutter/material.dart';

class GoBackAppbar {
  static getWidget(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).textTheme.body1.color,
      ),
      title: Text(
        'Takaisin',
        style: TextStyle(
          color: Theme.of(context).textTheme.body1.color,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
    );
  }
}
