class ScheduleEventModel {
  final DateTime startTime;
  final DateTime endTime;
  final String pictureUrl;
  final String title;
  final String text;
  final String location;

  ScheduleEventModel({
    this.startTime,
    this.endTime,
    this.pictureUrl,
    this.title,
    this.text,
    this.location,
  });

  factory ScheduleEventModel.fromJson(dynamic json) {
    return ScheduleEventModel(
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      pictureUrl: json['pictureUrl'],
      title: json['title'],
      text: json['text'],
      location: json['location'],
    );
  }
}
