import 'package:eventapp/profile/profile.dart';
import 'package:eventapp/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/feed/feed.dart';

import 'bottom_navigation.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final List<NavigationRoute> routes = [
      NavigationRoute(icon: Icons.home, text: 'Koti', widget: Text('WIP'),),
      NavigationRoute(icon: Icons.chat_bubble_outline, text: 'Julkaisut', widget: Feed(),),
      NavigationRoute(icon: Icons.add_circle_outline, text: 'Lähetä', widget: Text('WIP'),),
      NavigationRoute(icon: Icons.schedule, text: 'Aikataulu', widget: Schedule(),),
      NavigationRoute(icon: Icons.person_outline, text: 'Sinä', widget: Profile(),),
    ];

    return Scaffold(
        body: SafeArea(
          child: routes[selectedTab].widget,
        ),
        bottomNavigationBar: BottomNavigation(
          routes: routes,
          currentIndex: selectedTab,
          onTap: (index) {
            setState(() {
              selectedTab = index;
            });
          },
        )
    );
  }
}
