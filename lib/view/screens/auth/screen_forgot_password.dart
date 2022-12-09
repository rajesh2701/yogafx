import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
      children: [
        const Background(),
        bottomQuestionWidget(),
        formWidget(context)
      ],
    ));
  }

  Widget formWidget(BuildContext context) => Form(
        key: _formKey,
        child: Positioned(
            top: 218,
            left: 25,
            right: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Reset Password',
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Enter your email to Reset the password',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFieldForm(
                    controller: authController.emailPasswordResetController,
                    iconPrefix: Icons.email,
                    labelText: 'auth_hint_email'.tr,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator().email,
                    onChanged: (value) => {},
                    onSaved: (value) =>
                        authController.emailController.text = value!,
                    textInputAction: TextInputAction.next),
                SizedBox(
                  height: 14.h,
                ),
                PrimaryButton(
                    labelText: 'auth_reset_password'.tr,
                    onClciked: () async {}),
              ],
            )),
      );

  //BOTTOM QUESTION
  Widget bottomQuestionWidget() => Positioned(
        bottom: 28.h,
        left: 96.w,
        right: 96.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.black87,
              thickness: 2.h,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'auth_password_remember'.tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed('/login');
                  },
                  child: Text(
                    'auth_login'.tr,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColorsTheme.accentColor),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
