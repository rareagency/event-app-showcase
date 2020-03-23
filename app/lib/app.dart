import 'package:eventapp/login/login.dart';
import 'package:eventapp/profile/profile.dart';
import 'package:eventapp/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/feed/feed.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Route> routes = [
    Route(icon: Icons.home, widget: Feed(),),
    Route(icon: Icons.add_box, widget: Login(),),
    Route(icon: Icons.person, widget: Profile(),),
    Route(icon: Icons.schedule, widget: Schedule(),),
  ];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: routes[selectedTab].widget,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedTab,
          type: BottomNavigationBarType.fixed,

          items: routes.map((route) => BottomNavigationBarItem(
            icon: Icon(route.icon),
            title: Text(''),
          )).toList(),

          onTap: (index) {
            setState(() {
              selectedTab = index;
            });
          },
        ),
    );
  }
}

class Route {
  IconData icon;
  Widget widget;

  Route({
    @required this.icon,
    @required this.widget
  });
}