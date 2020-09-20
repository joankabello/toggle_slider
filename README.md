# toggle_slider
A Dart / Flutter package to create Toggle widgets with Sliders

[![Build Status](https://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger)

## Installation

- Add `toggle_slider` in `pubsec.yaml.`
- Import `package:toggle_slider/toggle_slider.dart` in your project.

## Example

```dart
// code away!

import 'package:flutter/material.dart';
import 'package:toggle_slider/toggle_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle Slider Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Slider Example'),
      ),
      body: Center(
        child: ToggleSlider(
          sliderContainerDecoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          toggleCardNumber: 4,
          sliderTitle: "Slider",
          divisions: 5,
          minSliderValue: 10,
          maxSliderValue: 50,
          sliderContainerHeight: 80,
          sliderContainerWidth: 400,
          cardColor: Colors.blue,
          cardAspectRatio: 1,
          cardWidth: 90,
          cardPadding: EdgeInsets.only(left: 10),
          cardChild: Column(children: [
            Image.network(
              "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png",
              width: 50,
              height: 30,
            ),
            Divider(
              endIndent: 10,
              indent: 10,
              color: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}

```

## Screenshots

[![Screenshots](https://i.imgur.com/UzMNWNt.jpg)]()
[![Screenshots](https://i.imgur.com/m0o6yzz.jpg)]()

## HAPPY CODING ... 🔨🔨🔨