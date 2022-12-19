import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/view/view.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().screenWidth > 1000
        ? Stack(
            children: [
              Positioned(
                  top: -0.2.sh,
                  left: 0.8.sw,
                  child: SizedBox(
                    width: 0.4.sh,
                    height: 0.4.sh,
                    child: Material(
                      color: AppColorsTheme.circleColor,
                      shape: const CircleBorder(),
                    ),
                  )),
              Positioned(
                  top: -0.07.sh,
                  left: 0.88.sw,
                  child: SizedBox(
                    width: 0.4.sh,
                    height: 0.4.sh,
                    child: Material(
                      color: AppColorsTheme.circleColor,
                      shape: const CircleBorder(),
                    ),
                  )),
            ],
          )
        : Stack(
            children: [
              Positioned(
                  top: -0.15.sh,
                  left: 0.6.sw,
                  child: SizedBox(
                    width: 258.h,
                    height: 258.h,
                    child: Material(
                      color: AppColorsTheme.circleColor,
                      shape: const CircleBorder(),
                    ),
                  )),
              Positioned(
                  top: -0.07.sh,
                  left: 0.75.sw,
                  child: SizedBox(
                    width: 258.h,
                    height: 258.h,
                    child: Material(
                      color: AppColorsTheme.circleColor,
                      shape: const CircleBorder(),
                    ),
                  )),
            ],
          );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: [
  //       Positioned(
  //           top: -150.h,
  //           left: 250.w,
  //           child: SizedBox(
  //             width: 258.h,
  //             height: 258.h,
  //             child: Material(
  //               color: AppColorsTheme.circleColor,
  //               shape: const CircleBorder(),
  //             ),
  //           )),
  //       Positioned(
  //           top: -100.h,
  //           left: 300.w,
  //           child: SizedBox(
  //             width: 258.h,
  //             height: 258.h,
  //             child: Material(
  //               color: AppColorsTheme.circleColor,
  //               shape: const CircleBorder(),
  //             ),
  //           )),
  //     ],
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: [
  //       Positioned(
  //           top: -100.h,
  //           //bottom: 818.h,
  //           //left: 250.w,
  //           right: -20.w,
  //           child: CircleAvatar(
  //             backgroundColor: AppColorsTheme.circleColor,
  //             //radius: 125.r,
  //             radius: ScreenUtil().orientation == Orientation.portrait
  //                 ? 0.2.sw
  //                 : 0.12.sw,
  //           )),
  //       Positioned(
  //           top: -50.h,
  //           //bottom: 818.h,
  //           //left: 300.w,
  //           right: -50.w,
  //           child: CircleAvatar(
  //             backgroundColor: AppColorsTheme.circleColor,
  //             //radius: 125.r,
  //             radius: ScreenUtil().orientation == Orientation.portrait
  //                 ? 0.2.sw
  //                 : 0.12.sw,
  //           )),
  //     ],
  //   );
  // }
}

class Background1 extends StatelessWidget {
  const Background1({super.key});

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
