library wave_divider;

import 'package:flutter/material.dart';

class WaveDivider extends StatelessWidget {
  final Color? color; // Color of the divider, null for default
  final double thickness; // Thickness of the divider line
  final double waveHeight; // Height of the wave pattern
  final double waveWidth; // Width of each wave segment
  final double verticalPadding; // Vertical padding around the divider
  const WaveDivider({
    super.key,
    this.thickness = 1,
    this.color,
    this.waveHeight = 5,
    this.waveWidth = 10,
    this.verticalPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    final contextColor = Theme.of(context).dividerColor;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: CustomPaint(
        size: const Size(double.infinity, 0),
        painter: SymmetricalWavyDividerPainter(
          waveColor: color ?? contextColor,
          strokeWidth: thickness,
          height: waveHeight,
          width: waveWidth,
        ),
      ),
    );
  }
}

class SymmetricalWavyDividerPainter extends CustomPainter {
  final Color waveColor; // Color of the wave pattern
  final double strokeWidth; // Stroke width of the wave pattern
  final double height; // Height of the wave pattern
  final double width; // Width of each wave segment
  SymmetricalWavyDividerPainter({
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
