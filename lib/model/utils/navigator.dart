import 'package:flutter/material.dart';
import 'package:get/get.dart';

void goToScreen(
    {required Widget widget,
    int duration = 600,
    Transition transition = Transition.leftToRight}) {
  Get.to(() => widget, duration: Duration(milliseconds: duration), transition: transition);
}

void goToScreenOff(
    {required Widget widget,
    int duration = 600,
    Transition transition = Transition.downToUp}) {
  Get.off(() => widget,
      duration: Duration(milliseconds: duration), transition: transition);
}

goToScreenOffAll(
    {required Widget widget,
    int duration = 600,
    Transition transition = Transition.rightToLeft}) {
  Get.offAll(() => widget,
      duration: Duration(milliseconds: duration), transition: transition);
}
