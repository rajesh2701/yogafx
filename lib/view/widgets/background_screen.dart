import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      drawCircles(0.85, 0.05, 0.25),
      drawCircles(0.95, 0.1, 0.25),
    ]);
  }

  Widget drawCircles(double width, double height, double radius) {
    return CustomPaint(
      painter: DrawCircle(
        offset: Offset(width.sw, height.sh),
        radius: radius.sw,
        color: AppColorsTheme.circleColor,
      ),
      child: Container(),
    );
  }
}
