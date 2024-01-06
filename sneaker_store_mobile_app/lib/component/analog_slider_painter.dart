import 'dart:math';

import 'package:flutter/material.dart';

class AnalogSliderPainter extends CustomPainter {
  final int itemCount;
  final int currentIndex;

  const AnalogSliderPainter({
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width / itemCount;

    for (int i = 0; i < itemCount; i++) {
      final Paint paint = Paint()
        ..color = Colors.blue.withOpacity(i == currentIndex ? 1.0 : 0.5)
        ..style = PaintingStyle.fill;

      final Rect rect = Rect.fromLTWH(i * width, 0, width, size.height);
      canvas.drawArc(
        rect,
        0,
        pi * 2,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
