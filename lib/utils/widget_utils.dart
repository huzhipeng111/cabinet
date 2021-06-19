import 'package:flutter/material.dart';

class WidgetUtils{

  static Widget buildStrokeWidget(String text , Color color, FontWeight fontWeight, double fontSize) {
    return Padding(
      child: StrokeWidget(
          strokeWidth: 0.5,
          edgeInsets: EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
          color: color,
          childWidget: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight),
          )
      ),
      padding: EdgeInsets.only(right: 5.0),
    );
  }
}

class StrokeWidget extends StatelessWidget {
  final Color color;
  final Widget childWidget;
  EdgeInsets edgeInsets;
  final double strokeWidth;
  final double strokeRadius;

  StrokeWidget(
      {Key key,
        @required this.childWidget,
        this.color = Colors.black,
        this.edgeInsets,
        this.strokeWidth = 1.0,
        this.strokeRadius = 5.0})
      : super(key: key) {
    if (null == edgeInsets)
      edgeInsets = EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: edgeInsets,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: strokeWidth),
            borderRadius: BorderRadius.circular(strokeRadius)),
        child: childWidget);
  }
}