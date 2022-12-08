import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/view/view.dart';

class BackgroundGraphic extends StatelessWidget {
  const BackgroundGraphic(
      {super.key, required this.height, required this.radius});

  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: height.h,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(radius.r)),
            color: AppColorsTheme.accentColor),
      ),
    );
  }
}
