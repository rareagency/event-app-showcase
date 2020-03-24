import 'package:eventapp/schedule/timeline.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _selectedIndex = 0;
  List<TimelineItem> _allItems = [
    TimelineItem(
      startTime: DateTime.now().add(Duration(minutes: 15)),
      endTime: DateTime.now().add(Duration(minutes: 30)),
      title: 'Random event #1',
      text: 'Event with end time and picture',
      pictureUrl: 'https://picsum.photos/500/200',
    ),
    TimelineItem(
      startTime: DateTime.now().add(Duration(days: 15)),
      title: 'Random event #2',
      text: 'Some event',
    ),
    TimelineItem(
        startTime: DateTime.now().add(Duration(minutes: 15)),
        title: 'Random event with very long name that wraps #1',
        text: 'Some text'
    )
  ];

  List<String> weekdays = [
    'Maanantai',
    'Tiistai',
    'Keskiviikko',
    'Torstai',
    'Perjantai',
    'Lauantai',
    'Sunnuntai'
  ];

  @override
  Widget build(BuildContext context) {
    var grouped = groupBy(_allItems, (TimelineItem item) =>
      '${item.startTime.weekday}');
    var dayNames = grouped.keys.map((key) => weekdays[int.parse(key) - 1]);
    var currentItems = grouped.values.toList()[_selectedIndex];

    return DefaultTabController(
      length: dayNames.length,
      initialIndex: _selectedIndex,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          centerTitle: true,
          title: Text('Aikataulu'),
          bottom: PreferredSize(
            child: TabBar(
              onTap: this._onTapSwitch,
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.white,
              tabs: dayNames.map((dayName) => Tab(
                  child: Text(dayName),
                )).toList()
              ),
            preferredSize: Size.fromHeight(30.0)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Timeline(
                items: currentItems,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSwitch(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
