library wave_divider;

import 'package:flutter/material.dart';
import 'package:wave_divider/src/symetrical_wavy_divider_painter.dart';
import 'package:wave_divider/src/vertical_wavy_divider_painter.dart';

/// Create a wavy line divider
///
///   The [color] argument can be null, it will be set to divider default color.
///   In case you want the line a little bit bold, [thickness] value will
///   help you on that.
///
///   With [waveHeight] and [waveWidth] arguments, you can control how the wave
///   look like.
///
///   The default [padding] of this widget is EdgeInsets.symmetric(vertical: 8)
///   you can change it with you custom value.
///
///   You can change direction of this divider by define [isVertical] value to
///   true or false. Or simply using our build-in constructor:
///   WaveDivider.vertical()
class WaveDivider extends StatelessWidget {
  final Color? color; // Color of the divider, null for default
  final double thickness; // Thickness of the divider line
  final double waveHeight; // Height of the wave pattern
  final double waveWidth; // Width of each wave segment
  final EdgeInsets padding; // Vertical padding around the divider
  final bool isVertical;
  const WaveDivider({
    super.key,
    this.thickness = .3,
    this.color,
    this.waveHeight = 5,
    this.waveWidth = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.isVertical = false,
  });

  /// Create a vertical wavy line divider
  ///
  ///   The [color] argument can be null, it will be set to divider default color.
  ///   In case you want the line a little bit bold, [thickness] value will
  ///   help you on that.
  ///
  ///   With [waveHeight] and [waveWidth] arguments, you can control how the wave
  ///   look like.
  ///
  ///   The default [padding] of this widget is EdgeInsets.symmetric(vertical: 8)
  ///   you can change it with you custom value.
  const WaveDivider.vertical(
      {super.key,
      this.thickness = .3,
      this.color,
      this.waveHeight = 5,
      this.waveWidth = 10,
      this.padding = const EdgeInsets.symmetric(vertical: 8),
      this.isVertical = true});

  @override
  Widget build(BuildContext context) {
    final contextColor = Theme.of(context).dividerColor;
    return Padding(
      padding: padding,
      child: isVertical
          ? CustomPaint(
              size: const Size(0, double.infinity),
              painter: VerticalWavyDividerPainter(
                waveColor: color ?? contextColor,
                strokeWidth: thickness,
                height: waveHeight,
                width: waveWidth,
              ),
            )
          : CustomPaint(
              size: const Size(double.infinity, 0),
              painter: HorizontalWavyDividerPainter(
                waveColor: color ?? contextColor,
                strokeWidth: thickness,
                height: waveHeight,
                width: waveWidth,
              ),
            ),
    );
  }
}
