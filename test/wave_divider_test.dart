import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wave_divider/src/wave_divider.dart'; // Import the WaveDivider widget

void main() {
  testWidgets('WaveDivider widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WaveDivider(
            color: Colors.blue,
            thickness: 2,
            waveHeight: 8,
            waveWidth: 16,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );

    // Verify that the widget has the correct properties.
    expect(find.byType(WaveDivider), findsOneWidget);
    expect(find.byType(CustomPaint), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);

    final waveDivider = tester.firstWidget(find.byType(WaveDivider)) as WaveDivider;

    // Verify that the properties of the WaveDivider match the ones set in the test.
    expect(waveDivider.color, Colors.blue);
    expect(waveDivider.thickness, 2);
    expect(waveDivider.waveHeight, 8);
    expect(waveDivider.waveWidth, 16);
    expect(waveDivider.padding, 12);
  });
}
