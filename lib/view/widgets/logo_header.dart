import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/view/view.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'App Logo',
        child: Icon(
          Icons.person,
          size: 100.r,
          color: AppColorsTheme.accentColor,
        ));
  }
}
