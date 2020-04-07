import 'package:collection/collection.dart';
import 'package:eventapp/pages/schedule/model.dart';

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

List<String> weekdays = [
  'Maanantai',
  'Tiistai',
  'Keskiviikko',
  'Torstai',
  'Perjantai',
  'Lauantai',
  'Sunnuntai'
];
