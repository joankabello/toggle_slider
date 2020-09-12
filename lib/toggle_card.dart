import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget toggleCard({
  @required BuildContext context,
  @required bool isSelected,
  Color cardColor,
  Widget child,
  double aspectRatio,
  double width,
  double height,
  BorderRadiusGeometry borderRadius,
  DecorationImage image,
  EdgeInsetsGeometry padding,
  String sliderValue,
  TextStyle cardValueStyle,
}) {
  return Align(
    alignment: Alignment(1.0, 1.0),
    child: AspectRatio(
      aspectRatio: aspectRatio ?? 1,
      child: Container(
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: image,
          borderRadius: borderRadius,
          color: cardColor ?? Colors.grey,
          border: Border(
            bottom: BorderSide(
                style: isSelected ? BorderStyle.none : BorderStyle.solid,
                width: 6,
                color: isSelected ? cardColor ?? Colors.grey : Colors.white),
          ),
        ),
        child: Column(
          children: [
            child ?? SizedBox(),
            Text(
              sliderValue.toString(),
              style: cardValueStyle,
            ),
          ],
        ),
      ),
    ),
  );
}
