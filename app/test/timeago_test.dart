import 'package:flutter_test/flutter_test.dart';
import 'package:eventapp/timeago.dart';

void main() {
  var now = new DateTime.now();

  test('is in future', () {
    expect(Timeago.format(now.subtract(new Duration(hours: -10))), 'tulevaisuudessa');
  });

  test('is under minute ago', () {
    expect(Timeago.format(now.subtract(new Duration(seconds: 30))), 'alle minuutti sitten');
  });

  test('is 15 minutes ago', () {
    expect(Timeago.format(now.subtract(new Duration(minutes: 15))), '15 minuuttia sitten');
  });

  test('is 3 days ago', () {
    expect(Timeago.format(now.subtract(new Duration(days: 3))), '3 päivää sitten');
  });

  test('is one year ago', () {
    expect(Timeago.format(now.subtract(new Duration(days: 365))), 'noin vuosi sitten');
  });

}
