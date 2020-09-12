import 'package:flutter/material.dart';

class TargetTemperatureSlider extends StatelessWidget {
  final double sliderValue;
  final bool visibility;
  final Function() onTap;
  final Function(double) onChanged;
  final String sliderTitle;
  final int divisions;
  final double minSliderValue;
  final double maxSliderValue;
  final double sliderContainerHeight;
  final double sliderContainerWidth;
  final Decoration sliderContainerDecoration;
  final TextStyle sliderTextStyle;

  const TargetTemperatureSlider({
    @required this.sliderValue,
    @required this.visibility,
    @required this.onTap,
    @required this.onChanged,
    @required this.sliderTitle,
    @required this.divisions,
    @required this.minSliderValue,
    @required this.maxSliderValue,
    this.sliderContainerHeight,
    this.sliderContainerWidth,
    this.sliderContainerDecoration,
    this.sliderTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Container(
        height: sliderContainerHeight,
        width: sliderContainerWidth,
        decoration: sliderContainerDecoration,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    sliderTitle,
                    style: Theme.of(context).textTheme.caption.merge(
                          TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 55,
                          ),
                        ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  child: GestureDetector(
                    child: Icon(Icons.close, size: 20),
                    onTap: onTap,
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      min: minSliderValue,
                      max: maxSliderValue,
                      divisions: divisions,
                      value: sliderValue ?? minSliderValue,
                      onChanged: onChanged,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      sliderValue == null ? "-" : sliderValue.toString(),
                      style: sliderTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
