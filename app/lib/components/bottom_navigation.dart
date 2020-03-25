import 'package:flutter/material.dart';

class NavigationRoute {
  IconData icon;
  String text;
  Widget widget;

  NavigationRoute({
    @required this.icon,
    @required this.text,
    @required this.widget
  });
}

class BottomNavigation extends StatelessWidget {
  final List<NavigationRoute> routes;
  final Function(int) onTap;
  final int currentIndex;

  BottomNavigation({this.routes, this.onTap, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 0.0, // shadow direction: bottom right
            offset: Offset(0.0, 4.0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.routes.asMap().map((i, route) {
          var color = currentIndex == i
              ? Theme.of(context).appBarTheme.iconTheme.color
              : Theme.of(context).textTheme.body1.color;

          return MapEntry(i, GestureDetector(
            onTap: () {
              this.onTap(i);
            },
            child: Container(
              width: 48.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    route.icon,
                    size: 32,
                    color: color,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    route.text,
                    style: TextStyle(
                        fontSize: 11,
                        color: color
                    ),
                  )
                ],
              ),
            ),
          ),);
        }).values.toList(),
      ),
    );
  }
}
