library toggle_slider;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_slider/custom_slider.dart';
import 'package:toggle_slider/toggle_card.dart';

class ToggleSlider extends StatefulWidget {
  final int toggleCardNumber;
  final String sliderTitle;
  final int divisions;
  final double minSliderValue;
  final double maxSliderValue;
  final double sliderContainerHeight;
  final double sliderContainerWidth;
  final Decoration sliderContainerDecoration;
  final Widget cardChild;
  final Color cardColor;
  final double cardAspectRatio;
  final double cardWidth;
  final double cardHeight;
  final BorderRadiusGeometry cardBorderRadius;
  final DecorationImage cardImage;
  final EdgeInsetsGeometry cardPadding;
  final TextStyle cardValueStyle;
  final TextStyle sliderTextStyle;

  ToggleSlider({
    Key key,
    this.toggleCardNumber = 1,
    this.sliderTitle,
    this.divisions,
    @required this.minSliderValue,
    @required this.maxSliderValue,
    this.sliderContainerHeight,
    this.sliderContainerWidth,
    this.sliderContainerDecoration,
    this.cardChild,
    this.cardColor,
    this.cardAspectRatio,
    this.cardWidth,
    this.cardBorderRadius,
    this.cardImage,
    this.cardPadding,
    this.cardHeight,
    this.cardValueStyle,
    this.sliderTextStyle,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ToggleSliderState();
}

class ToggleSliderState extends State<ToggleSlider> {
  List<bool> isSelected;
  bool visibility;

  List<bool> selectedList = [];
  List<double> targetTemperatureList = [];
  int currentPressedIndex;

  @override
  void initState() {
    for (int i = 0; i < widget.toggleCardNumber; i++) {
      selectedList.add(false);
    }
    for (int i = 0; i < widget.toggleCardNumber; i++) {
      targetTemperatureList.add(null);
    }
    visibility = false;
    isSelected = [false, false, false, false];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ToggleButtons(
          fillColor: Colors.transparent,
          selectedBorderColor: Colors.black54,
          disabledColor: Colors.black,
          selectedColor: Colors.white,
          color: Colors.black,
          renderBorder: false,
          children: <Widget>[
            for (var i = 0; i < selectedList.length; i++)
              Padding(
                padding: widget.cardPadding,
                child: toggleCard(
                  sliderValue: targetTemperatureList[i] == null
                      ? "-"
                      : targetTemperatureList[i].floorToDouble().toString(),
                  cardValueStyle: widget.cardValueStyle,
                  width: widget.cardWidth,
                  height: widget.cardHeight,
                  cardColor: widget.cardColor,
                  image: widget.cardImage,
                  aspectRatio: widget.cardAspectRatio,
                  context: context,
                  isSelected: selectedList[i],
                  child: widget.cardChild,
                ),
              )
          ],
          onPressed: (int index) {
            setState(() {
              for (var i = 0; i < selectedList.length; i++) {
                if (i != index) {
                  selectedList[i] = false;
                }
              }

              currentPressedIndex = index;
              selectedList[index] = !selectedList[index];
              visibility = selectedList[index];
            });
          },
          isSelected: selectedList,
        ),
        TargetTemperatureSlider(
          sliderContainerDecoration: widget.sliderContainerDecoration,
          sliderContainerHeight: widget.sliderContainerHeight,
          sliderContainerWidth: widget.sliderContainerWidth,
          minSliderValue: widget.minSliderValue,
          maxSliderValue: widget.maxSliderValue,
          divisions: widget.divisions,
          sliderTitle: widget.sliderTitle,
          sliderTextStyle: widget.sliderTextStyle,
          sliderValue: currentPressedIndex != null
              ? targetTemperatureList[currentPressedIndex]
              : null,
          visibility: visibility,
          onTap: () {
            setState(() {
              selectedList[currentPressedIndex] = false;
              visibility = false;
            });
          },
          onChanged: (newTargetTemperature) {
            setState(() {
              targetTemperatureList[currentPressedIndex] = newTargetTemperature;
            });
          },
        ),
      ],
    );
  }
}
