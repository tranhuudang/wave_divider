import 'package:flutter/material.dart';
import 'package:wave_divider/wave_divider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wave Divider In Action"),
        ),
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Default Wave Divider"),
              WaveDivider(),
              Text("Custom Wave Divider"),
              SizedBox(
                height: 200,
                child: WaveDivider.vertical(
                  color: Colors.blue,
                  thickness: 5,
                  waveWidth: 10,
                  waveHeight: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
