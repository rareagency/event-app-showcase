import 'package:collection/collection.dart';
import 'package:eventapp/models/schedule_event.dart';

class Services {
  static String getWeekday(DateTime date) {
    return weekdays[date.weekday];
  }

  static List<String> getScheduleWeekdays(List<ScheduleEvent> items) {
    return groupScheduleEventsByDate(items).keys.toList();
  }

  static Map<String, List<ScheduleEvent>> groupScheduleEventsByDate(List<ScheduleEvent> items) {
    return groupBy(items, (ScheduleEvent item) => getWeekday(item.startTime));
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
