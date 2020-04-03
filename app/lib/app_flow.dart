import 'package:flutter/widgets.dart';

class AppFlow {
  const AppFlow({
    @required this.title,
    @required this.iconData,
    @required this.navigatorKey,
    this.widget,
  })  : assert(title != null),
        assert(iconData != null),
        assert(navigatorKey != null);

  final String title;
  final IconData iconData;
  final Widget widget;
  final GlobalKey<NavigatorState> navigatorKey;
}