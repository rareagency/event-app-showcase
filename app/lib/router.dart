import 'package:ant_icons/ant_icons.dart';
import 'package:eventapp/pages/feed/feed.dart';
import 'package:eventapp/pages/imagepicker/imagepicker.dart';
import 'package:eventapp/pages/profile/profile.dart';
import 'package:eventapp/pages/schedule/schedule.dart';
import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon);
  final int index;
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Koti',  AntIcons.home_outline),
  Destination(1, 'Julkaisut', AntIcons.read_outline),
  Destination(2, 'Lisää', AntIcons.plus_circle_outline),
  Destination(3, 'Aikataulu', AntIcons.clock_circle_outline),
  Destination(4, 'Profiili', AntIcons.user),
];


class RootPage extends StatelessWidget {
  const RootPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: InkWell(
            child: getCurrentWidget()
          ),
        ),
      ),
    );
  }

  Widget getCurrentWidget() {
    switch (destination.index) {
      case 0:
        return Center(child: Text('TODO'));
      case 1:
        return Feed();
      case 2:
        return ImagePicker();
      case 3:
        return Schedule();
      case 4:
        return Profile();
    }

    return Container();
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination, this.onNavigation }) : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/imagepicker':
                return ImagePicker(destination: widget.destination);
            }

            return Center(child: Text('Unknown route'));
          },
        );
      },
    );
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}