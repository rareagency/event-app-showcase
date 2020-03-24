import 'package:collection/collection.dart';
import 'models.dart';

class Services {
  static String getWeekday(int index) {
    return weekdays[index];
  }

  static List<String> getScheduleWeekdays(List<TimelineItemModel> items) {
    return groupScheduleItemsByDate(items).keys.toList();
  }

  static Map<String, List<TimelineItemModel>> groupScheduleItemsByDate(List<TimelineItemModel> items) {
    return groupBy(items, (TimelineItemModel item) => getWeekday(item.startTime.weekday));
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
