import 'package:flutter/material.dart';

/// Draw vertical wavy line using Canvas
class VerticalWavyDividerPainter extends CustomPainter {
  final Color waveColor; // Color of the wave pattern
  final double strokeWidth; // Stroke width of the wave pattern
  final double width; // Width of the wave pattern
  final double height; // Height of each wave segment

  VerticalWavyDividerPainter({
    required this.width,
    required this.height,
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
    final waveWidth = width; // Adjust this value to control the wave width
    final waveHeight = height; // Adjust this value to control the wave height

    path.moveTo(size.width / 2, 0);
    bool up = true;

    for (double y = 0; y < size.height; y += waveHeight) {
      if (up) {
        path.relativeQuadraticBezierTo(
          -waveWidth,
          waveHeight / 2,
          0,
          waveHeight,
        );
      } else {
        path.relativeQuadraticBezierTo(
          waveWidth,
          waveHeight / 2,
          0,
          waveHeight,
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
