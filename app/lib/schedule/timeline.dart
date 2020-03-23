import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Timeline extends StatefulWidget {
  final List<TimelineItem> items;

  Timeline({
    Key key,
    this.items,
  }) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final timeFormatter = DateFormat('Hm');

  @override
  Widget build(BuildContext context) {
    double circleRadius = 30.0;
    double leftMargin = 80.0;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        var item = widget.items[itemIndex];

        return Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: (leftMargin + 20.0)),
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      0.0, circleRadius / 3, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )
                      ),

                      item.pictureUrl != null ? Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0,
                            0.0),
                        child: Image.network(
                          item.pictureUrl,
                          fit: BoxFit.fitHeight,
                        ),
                      ) : Container(),

                      item.text != null ? Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0,
                            0.0),
                        child: Text(item.text),
                      ) : Container()
                    ],
                  ),
                  width: double.infinity,
                ),
              ),
            ),

            Positioned(
              top: circleRadius / 1.1,
              bottom: 0.0,
              left: leftMargin / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      timeFormatter.format(widget.items[itemIndex].startTime),
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  item.endTime != null ? Text(
                      timeFormatter.format(item.endTime),
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .hintColor
                      )
                  ) : Container()
                ],
              ),
            ),

            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: leftMargin,
              child: Container(
                height: double.infinity,
                width: 1.0,
                color: Theme
                    .of(context)
                    .accentColor,
              ),
            ),

            Positioned(
              top: circleRadius / 1.5,
              left: leftMargin - circleRadius / 2,
              child: Container(
                height: circleRadius,
                width: circleRadius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme
                      .of(context)
                      .backgroundColor,
                ),
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme
                          .of(context)
                          .accentColor),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class TimelineItem {
  final DateTime startTime;
  final DateTime endTime;
  final String pictureUrl;
  final String title;
  final String text;

  TimelineItem({
    this.startTime,
    this.endTime,
    this.pictureUrl,
    @required this.title,
    this.text,
  });
}