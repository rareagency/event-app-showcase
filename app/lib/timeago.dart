class Timeago {
  static String format(DateTime date) {
    final num elapsed = DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    num seconds = elapsed / 1000;
    num minutes = seconds / 60;
    num hours = minutes / 60;
    num days = hours / 24;
    num months = days / 30;
    num years = days / 365;

    String result;

    if (seconds < 45) {
      result = 'alle minuutti';
    } else if (seconds < 90) {
      result = 'noin minuutti';
    } else if (minutes < 45) {
      minutes = minutes.round();
      result = '$minutes minuutti${minutes > 1 ? 'a' : ''}';
    } else if (minutes < 90) {
      result = 'noin tunti';
    } else if (hours < 24) {
      hours = hours.round();
      result = '$hours tunti${hours > 1 ? 'a' : ''}';
    } else if (hours < 48) {
      result = 'päivä';
    } else if (days < 30) {
      days = days.round();
      result = '$days päivä${days > 1 ? 'ä' : ''}';
    } else if (days < 60) {
      result = 'noin kuukausi';
    } else if (days < 365) {
      months = months.round();
      result = '$months ${months > 1 ? 'kuukautta' : 'kuukausi'}';
    } else if (years < 2) {
      result = 'noin vuosi';
    } else {
      years = years.round();
      result = '$years ${years > 1 ? 'vuotta' : 'vuosi'}';
    }

    return '$result sitten';
  }
}

void main() {
  print(Timeago.format(new DateTime.now().subtract(new Duration(minutes: 15))));
}