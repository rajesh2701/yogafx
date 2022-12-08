import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:yogafx/view/view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Device Height : ${ScreenUtil().screenHeight}');
    print(292.h);
    print('Device Width : ${ScreenUtil().screenWidth}');
    print(926.w);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGraphic(height: 700, radius: 120),
          // Positioned(
          //     //top: 286,
          //     bottom: 287,
          //     left: 48,
          //     right: 48,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(
          //           Icons.person,
          //           color: Colors.white,
          //           size: 276.w,
          //         ),
          //         SizedBox(
          //           height: 6.h,
          //         ),
          //         Text(
          //           'app_name'.tr.toUpperCase(),
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               fontSize: 64.sp,
          //               fontWeight: FontWeight.w700,
          //               color: Colors.white),
          //         )
          //       ],
          //     )),
          Positioned(
              bottom: 364.h,
              right: 76,
              left: 76,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 276.w,
              )),
          Positioned(
              bottom: 287.h,
              right: 48,
              left: 48,
              child: Text(
                'app_name'.tr.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          Positioned(
            bottom: 127.h,
            left: 28.w,
            right: 28.w,
            child: PrimaryButton(
                labelText: 'auth_register'.tr,
                color: AppColorsTheme.subtextBlack,
                onClciked: () {
                  Get.toNamed('/register');
                }),
          ),
          Positioned(
            bottom: 65.h,
            left: 28.w,
            right: 28.w,
            child: PrimaryButton(
                labelText: 'auth_login'.tr,
                onClciked: () {
                  Get.toNamed('/login');
                }),
          ),
        ],
      ),
    );
  }
}
