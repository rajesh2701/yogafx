import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yogafx/view/view.dart';

class GetSnackbarHelper {
  static showGetSnackbar(
      {required String title,
      required String message,
      SnackPosition? snackPosition}) {
    Get.snackbar(title, message,
        snackPosition: snackPosition,
        colorText: AppColorsTheme.accentColor,
        icon: Icon(
          Icons.account_circle,
          size: 16.sp,
          color: AppColorsTheme.white,
        ),
        backgroundColor: AppColorsTheme.black);
  }
}
