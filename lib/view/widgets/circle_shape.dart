import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Circle extends StatelessWidget {
  const Circle(
      {super.key,
      this.alignMent = Alignment.topRight,
      required this.widthOffset,
      required this.heightOffset,
      required this.circleRadius,
      this.circleColor = Colors.black38});

  final AlignmentGeometry alignMent;
  final double widthOffset;
  final double heightOffset;
  final double circleRadius;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignMent,
      child: Transform.translate(
        offset: Offset(widthOffset.w, heightOffset.h),
        child: Material(
          color: circleColor,
          shape: const CircleBorder(),
          child: Padding(padding: EdgeInsets.all(circleRadius.r)),
        ),
      ),
    );
  }
}