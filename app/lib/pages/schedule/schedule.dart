import 'package:eventapp/pages/schedule/model.dart';
import 'package:eventapp/pages/schedule/schedule_gql.dart';
import 'package:eventapp/pages/schedule/tab_indicator.dart';
import 'package:eventapp/pages/schedule/timeline.dart';
import 'package:eventapp/services.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(getScheduleEvents),
      ),
      builder: (result, { refetch, fetchMore }) {
        if (result.hasException) {
          return Center(child: Text(result.exception.toString()));
        }

        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }

        List<dynamic> nodes = result.data['scheduleEvents']['nodes'];
        List<ScheduleEventModel> scheduleEvents =
          nodes.map((node) => ScheduleEventModel.fromJson(node)).toList();

        return scheduleComponent(scheduleEvents);
      },
    );
  }

  Widget scheduleComponent(List<ScheduleEventModel> scheduleEvents) {
    var weekdayNames = Services.getScheduleWeekdays(scheduleEvents);
    var scheduleEventsByDate = Services.groupScheduleEventsByDate(scheduleEvents);

    return DefaultTabController(
      length: weekdayNames.length,
      initialIndex: _currentTabIndex,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                onTap: _onTabSwitch,
                isScrollable: true,
                labelColor: Theme.of(context).textTheme.body1.color,
                unselectedLabelColor: Theme.of(context).textTheme.body2.color,
                indicatorColor: Theme.of(context).accentColor,
                indicator: CupertinoishTabIndicator(
                  color: Theme.of(context).accentColor,
                  width: 35,
                  radius: 2,
                ),
                labelStyle: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5
                ),
                tabs: weekdayNames.map((dayName) => Container(
                  height: 50,
                  child: Tab(
                    text: dayName,
                  ),
                )).toList()
              ),
            ),
            Expanded(
              child: TabBarView(
                children: scheduleEventsByDate.values.map((dayItems) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                    child: Timeline(
                      indicatorSize: 20,
                      items: dayItems,
                      startTimeStyle: Theme.of(context).textTheme.body1,
                      endTimeStyle: Theme.of(context).textTheme.body2,
                      indicatorColor: Theme.of(context).accentColor,
                      lineColor: Theme.of(context).accentColor,
                      lineGap: 5,
                      gutterSpacing: 18,
                    ),
                  );
                }).toList()
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTabSwitch(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }
}
