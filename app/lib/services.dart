import 'dart:async';

import 'package:collection/collection.dart';
import 'package:connectivity/connectivity.dart';
import 'package:eventapp/pages/schedule/model.dart';
import 'package:eventapp/widgets/disconnected.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Services {
  static String getWeekday(DateTime date) {
    return weekdays[date.weekday];
  }

  static List<String> getScheduleWeekdays(List<ScheduleEventModel> items) {
    return groupScheduleEventsByDate(items).keys.toList();
  }

  static Map<String, List<ScheduleEventModel>>
    groupScheduleEventsByDate(List<ScheduleEventModel> items) {
    return groupBy(items, (ScheduleEventModel item) => getWeekday(item.startTime));
  }
}

class ConnectionService {
  StreamSubscription<ConnectivityResult> subscription;

  void checkConnection(BuildContext context) {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Disconnected(),
        ));
      }
    });
  }

  void dispose() {
    subscription.cancel();
  }
}

List<String> weekdays = [
  'Maanantai',
  'Tiistai',
  'Keskiviikko',
  'Torstai',
  'Perjantai',
  'Lauantai',
  'Sunnuntai'
];
