import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:yogafx/view/view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGraphic(height: 700, radius: 120),
          Positioned(
              top: 285.h,
              left: 48.w,
              right: 48.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 275.w,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'app_name'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 64.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )
                ],
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
