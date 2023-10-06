import 'dart:math';

import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  const RadialPercentWidget({
    this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Center(
          child: child,
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = _calculateArcSize(size);
    _drawBackground(canvas, size);
    _drawFreeArc(canvas, arcRect);
    _drawFilledArc(canvas, arcRect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Rect _calculateArcSize(Size size) {
    const linesMargin = 5;
    final offset = lineWidth / 2 - linesMargin;
    final arcRect = Offset(offset, offset) &
    Size(size.width - 2 * offset, size.height - 2 * offset);
    return arcRect;
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  void _drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint()
      ..color = freeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void _drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(arcRect, -pi / 2, pi * 2 * percent, false, paint);
  }
}
