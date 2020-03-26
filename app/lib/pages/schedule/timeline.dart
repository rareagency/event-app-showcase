import 'package:eventapp/models/schedule_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Timeline extends StatefulWidget {
  final List<ScheduleEvent> items;

  Timeline(this.items, { Key key }) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final _timeFormatter = DateFormat('Hm');

  @override
  Widget build(BuildContext context) {
    double circleRadius = 30.0;
    double leftMargin = 80.0;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        var item = widget.items[itemIndex];
        var hasPicture = item.pictureUrl != null;
        var hasText = item.text != null;
        var hasEndTime = item.endTime != null;

        return Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: (leftMargin + 20.0)),
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, circleRadius / 3, 0, 0),
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

                      hasPicture ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                        child: Image.network(
                          item.pictureUrl,
                          fit: BoxFit.fitHeight,
                        ),
                      ) : Container(),

                      hasText ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0,
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
                    _timeFormatter.format(widget.items[itemIndex].startTime),
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                  ),
                  hasEndTime ? Text(
                      _timeFormatter.format(item.endTime),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.body2.color,
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
                color: Theme.of(context).accentColor,
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
                  color: Theme.of(context).backgroundColor,
                ),
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

