import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';
import 'package:yogafx/controller/controller.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  //APPBAR
  PreferredSizeWidget _appBar() => AppBar(
        title: Text('app_name'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Log Out',
                  middleText: 'Are you sure to Logout',
                  barrierDismissible: false,
                  confirm: TextButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      child: Text(
                        'Confirm',
                        style: fontAccent10Style,
                      )),
                  cancel: TextButton(
                      onPressed: () {
                        Get.back(closeOverlays: true);
                      },
                      child: const Text('Cancel')));
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const ScreenSettings(),
                  duration: const Duration(milliseconds: 600),
                  transition: Transition.leftToRight);
            },
            icon: const Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      );

  // BODY
  Widget _body() => GetBuilder<AppController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: anatomyImageContainer(controller),
            ),
            Expanded(
              flex: 1,
              child: dropDownContainer(controller),
            )
          ],
        );
      });

  // ANATOMY IMAGE CONTAINDER
  Widget anatomyImageContainer(AppController controller) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: InteractiveViewer(
          child: Image.asset(
            controller.anatomyImage,
            fit: BoxFit.fill,
          ),
        ),
      );

  Widget anatomyImageContainerOld(AppController controller) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              //child: Text('Select a body part for Checkup'),
              child: Obx(() => Text(
                    'Welcome ${authController.userNameToDisplay}',
                    style: fontAccent15Style,
                  )),
            ),
            Expanded(
              flex: 7,
              child: InteractiveViewer(
                  child: Image.asset(controller.anatomyImage)),
              // child: Icon(
              //   Icons.person,
              //   size: 250,
              // ),
            )
          ],
        ),
      );

  // DROPDOWN LIST CONTAINER
  Widget dropDownContainer(AppController controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: 'Muscler Body',
                onChanged: (String? bodyType) {
                  controller.bodyType = bodyType!;
                  controller.imageAssetString();
                  controller.update();
                },
                items: <String>['Muscler Body', 'Skelton Body']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorsTheme.subtextBlack, width: 0.2.h)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorsTheme.subtextBlack, width: 0.2.h)),
                ),
              ),
            ),
            const EmptySpaceDevider(),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: 'Front Side',
                onChanged: (String? bodyView) {
                  controller.bodyView = bodyView!;
                  controller.imageAssetString();
                  controller.update();
                },
                items: <String>['Front Side', 'Back Side']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorsTheme.subtextBlack, width: 0.2.h)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorsTheme.subtextBlack, width: 0.2.h)),
                ),
              ),
            ),
          ],
        ),
      );
}
