import 'package:eventapp/models/schedule_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class Timeline extends StatelessWidget {
  const Timeline({
    @required this.items,
    @required this.startTimeStyle,
    @required this.endTimeStyle,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
    this.leftMargin = 70.0,
  })  : itemCount = items.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null);


  final List<ScheduleEvent> items;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget> indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController controller;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final double leftMargin;
  final TextStyle startTimeStyle;
  final TextStyle endTimeStyle;

  @override
  Widget build(BuildContext context) {
    intl.DateFormat dateFormatter = intl.DateFormat('Hm');

    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        var item = items[index];
        var hasLocation = item.location != null;
        var hasText = item.text != null;
        var hasPicture = item.pictureUrl != null;

        final child = Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: Theme.of(context).textTheme.body1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10,),

              if (hasPicture) Column(
                children: [
                  SizedBox(height: 6,),
                  ClipRRect(
                    child: Image(image: NetworkImage(item.pictureUrl),),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  SizedBox(height: 10,),
                ],
              ),

              if (hasText) Column(
                children: <Widget>[
                    Text(
                      item.text,
                      style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  SizedBox(height: 10,),
                ],
              ),

              if (hasLocation) Row(
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    color: Theme.of(context).textTheme.body1.color,
                    size: 20,
                  ),
                  SizedBox(width: 8,),
                  Text(
                    item.location,
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
            ],
          ),
        );

        Widget indicator;
        if (indicators != null) {
          indicator = indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
              leftMargin: leftMargin,
              startTime: item.startTime,
              endTime: item.endTime,
              startTimeStyle: startTimeStyle,
              endTimeStyle: endTimeStyle,
              dateFormatter: dateFormatter,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing + leftMargin),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    @required this.hideDefaultIndicator,
    @required this.indicatorColor,
    @required this.indicatorStyle,
    @required this.indicatorSize,
    @required this.lineGap,
    @required this.strokeCap,
    @required this.strokeWidth,
    @required this.style,
    @required this.lineColor,
    @required this.isFirst,
    @required this.isLast,
    @required this.itemGap,
    @required this.leftMargin,
    @required this.startTime,
    @required this.endTime,
    @required this.startTimeStyle,
    @required this.endTimeStyle,
    @required this.dateFormatter,
  })  : linePaint = Paint()
    ..color = lineColor
    ..strokeCap = strokeCap
    ..strokeWidth = strokeWidth
    ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;
  final double leftMargin;
  final DateTime startTime;
  final DateTime endTime;
  final TextStyle startTimeStyle;
  final TextStyle endTimeStyle;
  final intl.DateFormat dateFormatter;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius + leftMargin, 0.0 - halfItemGap));
    final centerTop = size.topLeft(
      Offset(indicatorRadius + leftMargin, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius + leftMargin, 0.0 + halfItemGap));
    final centerBottom = size.topLeft(
      Offset(indicatorRadius + leftMargin, indicatorMargin*1.5),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.topLeft(Offset(indicatorRadius + leftMargin, indicatorRadius / 1.25));
      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }

    if (startTime != null) {
      TextSpan startTimeSpan = new TextSpan(
        text: dateFormatter.format(startTime),
        style: startTimeStyle,
      );
      TextPainter tp = new TextPainter(text: startTimeSpan,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(leftMargin / 4, 0));
    }

    if (endTime != null) {
      double textMargin = startTimeStyle.fontSize == null ? 18 : startTimeStyle.fontSize + 2;

      TextSpan endTimeSpan = new TextSpan(
        text: dateFormatter.format(endTime),
        style: endTimeStyle,
      );
      TextPainter tp = new TextPainter(text: endTimeSpan,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(leftMargin / 4, textMargin));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
