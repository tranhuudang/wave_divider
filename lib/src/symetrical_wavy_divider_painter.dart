import 'package:flutter/material.dart';

/// Draw horizontal wavy line using Canvas
class HorizontalWavyDividerPainter extends CustomPainter {
  final Color waveColor; // Color of the wave pattern
  final double strokeWidth; // Stroke width of the wave pattern
  final double height; // Height of the wave pattern
  final double width; // Width of each wave segment
  HorizontalWavyDividerPainter({
    required this.height,
    required this.width,
    required this.waveColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path();
    final waveHeight = height; // Adjust this value to control the wave height
    final waveWidth = width; // Adjust this value to control the wave width

    path.moveTo(0, size.height / 2);
    bool up = true;

    for (double x = 0; x < size.width; x += waveWidth) {
      if (up) {
        path.relativeQuadraticBezierTo(
          waveWidth / 2,
          -waveHeight,
          waveWidth,
          0,
        );
      } else {
        path.relativeQuadraticBezierTo(
          waveWidth / 2,
          waveHeight,
          waveWidth,
          0,
        );
      }
      up = !up;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}