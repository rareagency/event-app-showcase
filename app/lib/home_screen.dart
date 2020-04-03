import 'package:ant_icons/ant_icons.dart';
import 'package:eventapp/app_flow.dart';
import 'package:eventapp/pages/feed/feed.dart';
import 'package:eventapp/pages/profile/profile.dart';
import 'package:eventapp/pages/schedule/schedule.dart';
import 'package:eventapp/widgets/add_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBarIndex = 0;
  int _previousBarIndex;
  GlobalKey _bottomNavKey = GlobalKey();
  AddPopupMenu _addPopupMenu;

  final List<AppFlow> appFlows = [
    AppFlow(
      title: 'Koti',
      iconData: AntIcons.home_outline,
      widget: Center(child: Text('TO-DO')),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
    AppFlow(
      title: 'Julkaisut',
      iconData: AntIcons.read_outline,
      widget: Feed(),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
    AppFlow(
      title: 'Lisää',
      iconData: AntIcons.plus_circle_outline,
      widget: Feed(),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
    AppFlow(
      title: 'Aikataulu',
      iconData: AntIcons.clock_circle_outline,
      widget: Schedule(),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
    AppFlow(
      title: 'Profiili',
      iconData: AntIcons.user,
      widget: Profile(),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentFlow = appFlows[_currentBarIndex];
    _addPopupMenu = AddPopupMenu(
      context,
      onDismiss: () {
        setState(() {
          _currentBarIndex = _previousBarIndex;
        });
      }
    );

    // We're preventing the root navigator from popping and closing the app
    // when the back button is pressed and the inner navigator can handle it.
    // That occurs when the inner has more than one page on its stack.
    // You can comment the onWillPop callback and watch "the bug".
    return WillPopScope(
      onWillPop: () async =>
        !await currentFlow.navigatorKey.currentState.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentBarIndex == 2 ? _previousBarIndex : _currentBarIndex,
          children: appFlows.map(_buildIndexedPageFlow).toList(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]
          ),
          child: BottomNavigationBar(
            key: _bottomNavKey,
            currentIndex: _currentBarIndex,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: appFlows.asMap().map((i, flow) =>
              MapEntry(i, BottomNavigationBarItem(
                icon: Icon(
                  flow.iconData,
                  color: Theme.of(context).textTheme.body1.color
                ),
                activeIcon: Icon(
                  flow.iconData,
                  size: 32,
                  color: Theme.of(context).accentColor
                ),
                title: Text(
                  flow.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: _currentBarIndex == i
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.body1.color
                  ),
                ),
              ),
            )).values.toList(),
            onTap: (newIndex) => setState(() {
              _previousBarIndex = _currentBarIndex;
              _currentBarIndex = newIndex;

              if (_currentBarIndex == 2) {
                _addPopupMenu.showAt(_bottomNavKey);
              }
            }),
          ),
        ),
      ),
    );
  }

  // The best practice here would be to extract this to another Widget,
  // however, moving it to a separate class would only harm the
  // readability of our guide.
  Widget _buildIndexedPageFlow(AppFlow appFlow) => Navigator(
    // The key enables us to access the Navigator's state inside the
    // onWillPop callback and for emptying its stack when a tab is
    // re-selected. That is why a GlobalKey is needed instead of
    // a simpler ValueKey.
    key: appFlow.navigatorKey,
    // onGenerateRoute callback will be called only for the initial route.
    onGenerateRoute: (settings) => MaterialPageRoute(
      settings: settings,
      builder: (context) => Scaffold(
        body: SafeArea(
          child: SafeArea(
            child: appFlow.widget,
          ),
        ),
      ),
    ),
  );
}