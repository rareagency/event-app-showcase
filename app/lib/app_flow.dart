import 'package:flutter/widgets.dart';

class AppFlow {
  const AppFlow({
    @required this.title,
    @required this.iconData,
    @required this.widget,
    @required this.navigatorKey,
  })  : assert(title != null),
        assert(iconData != null),
        assert(widget != null),
        assert(navigatorKey != null);

  final String title;
  final IconData iconData;
  final Widget widget;
  final GlobalKey<NavigatorState> navigatorKey;
}