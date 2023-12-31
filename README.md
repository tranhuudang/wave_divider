# wave_divider

The wave_divider package is a versatile Flutter widget that enables you to add beautiful, wave-like dividers to your UI. Whether you want to enhance the visual appeal of your app or create a decorative separation between sections, the WaveDivider widget makes it easy and customizable.

[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/tranhuudang/wave_divider?style=flat&logo=github&colorB=green&label=stars)](https://github.com/tranhuudang/wave_divider/stargazers)
[![Pub Version](https://img.shields.io/pub/v/wave_divider.svg)](https://pub.dev/packages/wave_divider/)

![Screenshot](https://github.com/tranhuudang/wave_divider/blob/master/example/assets/screenshot_1.png?raw=true)

## Usage

The `WaveDivider` widget provides a simple wave divider that you can customize. Here are some usage examples:

1. Using the default divider:
```dart
    // Horizontal divider
    WaveDivider()
    // Vertical divider
    SizedBox(
      height: 200, 
      child: WaveDivider.vertical(),
    )
```

   or a little bit of custom with:
```dart 
    WaveDivider(
      thickness: 3,
      color: Colors.amber,
      waveHeight: 7,
      waveWidth: 14,
      isVertical: false,
    )
```

### Support the Library

You can support the library by liking it on pub, staring in on Github and reporting any bugs you
encounter.