import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yogafx/controller/controller.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class ScreenLoading extends StatefulWidget {
  const ScreenLoading({super.key});

  @override
  State<ScreenLoading> createState() => _ScreenLoadingState();
}

class _ScreenLoadingState extends State<ScreenLoading> {
  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: AppColorsTheme.accentColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Loading...',
              style: fontAccent15Style,
            )
          ],
        ),
      ),
    );
  }
}
