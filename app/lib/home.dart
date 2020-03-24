import 'package:eventapp/login/login.dart';
import 'package:eventapp/profile/profile.dart';
import 'package:eventapp/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/feed/feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Feed'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box),
      title: Text('Add content'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.schedule),
      title: Text('Schedule'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: getCurrentWidget(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          items: bottomNavigationItems,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
    );
  }

  Widget getCurrentWidget() {
    if (_selectedIndex == 0) {
      return Feed();
    } else if (_selectedIndex == 1) {
      return Login(); // TODO: Placeholder until image picking is implemented.
    } else if (_selectedIndex == 2) {
      return Profile();
    } else if (_selectedIndex == 3) {
      return Schedule();
    } else {
      return Container();
    }
  }

  void _onItemTapped(int index) {
    print('Item index: $index');

    setState(() {
      _selectedIndex = index;
    });
  }
}
