import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

class GoBackAppbar {
  static getWidget(BuildContext context) {
    return AppBar(
      leading: new IconButton(
        icon: new Icon(AntIcons.arrow_left, color: Theme.of(context).textTheme.body1.color),
        onPressed: () => Navigator.of(context).pop(),
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
