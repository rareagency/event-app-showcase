import 'package:eventapp/router.dart';
import 'package:eventapp/widgets/add_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with TickerProviderStateMixin<App> {
  int _currentIndex = 0;
  List<Key> _destinationKeys;
  GlobalKey _bottomNavKey = GlobalKey();
  AddPopupMenu _addPopupMenu;
  List<AnimationController> _faders;
  AnimationController hide;

  @override
  void initState() {
    super.initState();

    _faders = allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys = List<Key>.generate(allDestinations.length, (int index) => GlobalKey()).toList();
    hide = AnimationController(vsync: this, duration: kThemeAnimationDuration, value: 1);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders)
      controller.dispose();
    hide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _addPopupMenu = AddPopupMenu(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: allDestinations.map((Destination destination) {
            final Widget view = FadeTransition(
              opacity: _faders[destination.index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
              child: KeyedSubtree(
                key: _destinationKeys[destination.index],
                child: DestinationView(
                  destination: destination,
                  onNavigation: () {
                    hide.forward();
                  },
                ),
              ),
            );

            if (destination.index == _currentIndex) {
              _faders[destination.index].forward();
              return view;
            } else {
              _faders[destination.index].reverse();
              if (_faders[destination.index].isAnimating) {
                return IgnorePointer(child: view);
              }
              return Offstage(child: view);
            }
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 5)]
        ),
        child: SizeTransition(
          sizeFactor: hide,
          axisAlignment: -1.0,
          child: BottomNavigationBar(
            key: _bottomNavKey,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: _currentIndex,
            onTap: (int index) {
              if (index == 2) {
                _addPopupMenu.showAt(_bottomNavKey);
                return;
              }

              setState(() {
                _currentIndex = index;
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                icon: Icon(
                  destination.icon,
                  color: Theme.of(context).textTheme.body1.color
                ),
                activeIcon: Icon(
                  destination.icon,
                  size: 32,
                  color: Theme.of(context).accentColor
                ),
                title: Text(
                    destination.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: _currentIndex == destination.index
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textTheme.body1.color
                    ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
