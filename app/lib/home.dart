import 'dart:io';

import 'package:eventapp/login.dart';
import 'package:eventapp/profile.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/feed.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  File _image;

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: getCurrentWidget(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          items: bottomNavigationItems,
          onTap: _onItemTapped,
        ),
    );
  }

  Widget getCurrentWidget() {
    if (_selectedIndex == 0) {
      return Feed();
    } else if (_selectedIndex == 1) {
      return Login();
    } else {
      return Profile();
    }
  }

  Future getImage() async {
    // TODO Both camera and gallery support (dropdown menu maybe?)
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _onItemTapped(int index) {
    print('Item index: $index');

    if (index == 1) {
      getImage();
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}
