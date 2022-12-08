import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/view/view.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 818.h,
            left: 254.w,
            child: SizedBox(
              width: 258.w,
              height: 258.w,
              child: Material(
                color: AppColorsTheme.circleColor,
                shape: const CircleBorder(),
                //child: Padding(padding: EdgeInsets.all(258.r)),
              ),
            )),
        Positioned(
            bottom: 772.h,
            left: 289.w,
            child: SizedBox(
              width: 258.w,
              height: 258.w,
              child: Material(
                color: AppColorsTheme.circleColor,
                shape: const CircleBorder(),
                //child: Padding(padding: EdgeInsets.all(258.r)),
              ),
            ))
      ],
    );
  }
}