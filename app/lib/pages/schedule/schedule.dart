import 'package:eventapp/api.dart';
import 'package:eventapp/pages/schedule/timeline.dart';
import 'package:eventapp/services.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var weekdayNames = Services.getScheduleWeekdays(scheduleItems);
    var selectedWeekday = weekdayNames[selectedTabIndex];
    var currentItems = Services.groupScheduleEventsByDate(scheduleItems)[selectedWeekday];

    return DefaultTabController(
      length: weekdayNames.length,
      initialIndex: selectedTabIndex,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: true,
          title: Text('Aikataulu'),
          bottom: PreferredSize(
            child: TabBar(
              onTap: _onTapSwitch,
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.white,
              tabs: weekdayNames.map((dayName) => Tab(
                  child: Text(dayName),
                )).toList()
              ),
            preferredSize: Size.fromHeight(30.0)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Timeline(currentItems),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSwitch(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
