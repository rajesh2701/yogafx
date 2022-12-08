import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Background(),
            bottomQuestionWidget(),
            formWidget(context),
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
                  'Login',
                  style: GoogleFonts.comfortaa(
                      fontSize: 40.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Please sign in to continue',
                  style: GoogleFonts.comfortaa(
                      fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFieldForm(
                    controller: authController.emailController,
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
                TextFieldForm(
                  controller: authController.passWordController,
                  iconPrefix: Icons.lock,
                  labelText: 'auth_hint_password'.tr,
                  validator: Validator().password,
                  obscureText: true,
                  onChanged: (value) {},
                  onSaved: (value) =>
                      authController.passWordController.text = value!,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'auth_forgot_password'.tr,
                      style: GoogleFonts.comfortaa(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(
                          () => ScreenForgotPassword(),
                          duration: const Duration(milliseconds: 600),
                          transition: Transition.downToUp,
                        );
                      },
                      child: Text(
                        'auth_reset_password'.tr,
                        style: GoogleFonts.comfortaa(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColorsTheme.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                PrimaryButton(
                    labelText: 'auth_login'.tr,
                    onClciked: () async {
                      if (_formKey.currentState!.validate()) {
                        authController.signInWithEmailAndPassword(context);
                      }
                    }),
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
                  'auth_no_account'.tr,
                  style: GoogleFonts.comfortaa(
                      fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                  onTap: () {
                    Get.off(
                      () => ScreenRegister(),
                      duration: const Duration(milliseconds: 600),
                      transition: Transition.downToUp,
                    );
                  },
                  child: Text(
                    'auth_register'.tr,
                    style: GoogleFonts.comfortaa(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColorsTheme.black),
                  ),
                ),
              ],
            )

            // RichTextQuestion(
            //     textQuestion: 'auth_no_account'.tr,
            //     linkText: 'auth_register'.tr,
            //     onClick: () {
            //       Get.off(
            //         () => ScreenRegister(),
            //         duration: const Duration(milliseconds: 600),
            //         transition: Transition.downToUp,
            //       );
            //     }
            // ),
          ],
        ),
      );
}
