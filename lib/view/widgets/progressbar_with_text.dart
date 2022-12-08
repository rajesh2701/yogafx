import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yogafx/controller/controller.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class ProgressBarText extends StatelessWidget {
  const ProgressBarText({super.key, required this.loadingText});

  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Container(
          child: controller.isLoading ? widgetLoader() : const SizedBox(),
        );
      },
    );
  }

  Widget widgetLoader() => Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: AppColorsTheme.black,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: CircularProgressIndicator(
                    color: AppColorsTheme.accentColor,
                  ),
                ),
                const EmptySpaceDevider(
                  height: 15,
                  width: 0,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    loadingText,
                    style: fontAccent10Style,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
