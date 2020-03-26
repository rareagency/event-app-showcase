import 'package:flutter/material.dart';

class CupertinoishTabIndicator extends Decoration {
  final BoxPainter _painter;

  CupertinoishTabIndicator({
    @required Color color,
    @required double width,
    @required double radius
  }) : _painter = _RoundedRectPainter(color, width, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _RoundedRectPainter extends BoxPainter {
  final Paint _paint;
  final double radius;
  final double width;

  _RoundedRectPainter(Color color, this.width, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    var startX = offset.dx + 16;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(startX, cfg.size.height - 5, startX + width, cfg.size.height),
            Radius.circular(3)
        ), _paint
    );
  }
}