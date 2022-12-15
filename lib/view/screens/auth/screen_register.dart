import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yogafx/controller/controller.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({super.key});

  final _formKey = GlobalKey<FormState>();

  //TEXT EDITING CONTROLLERS

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return stackContainer(authController);
        },
      ),
    );
  }

  Widget stackContainer(AuthController authController) => Stack(
        children: [
          const Background(),
          bottomQuestionWidget(),
          authController.signUpNext ? formWidget2() : formWidget1()
        ],
      );

  // FROM WIDGET 1 FOR NAME & EMAIL
  Widget formWidget1() => Positioned(
        top: 250.h,
        left: 25.w,
        right: 25.w,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create Account',
                style: GoogleFonts.comfortaa(
                    fontSize: 40.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 22.h,
              ),
              TextFieldForm(
                controller: authController.firstNameController,
                iconPrefix: Icons.person,
                labelText: 'auth_hint_firstname'.tr,
                keyboardType: TextInputType.name,
                validator: Validator().name,
                onChanged: (value) => {},
                onSaved: (value) =>
                    authController.firstNameController.text = value!,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldForm(
                controller: authController.signUpEmailController,
                iconPrefix: Icons.email,
                labelText: 'auth_hint_email'.tr,
                keyboardType: TextInputType.emailAddress,
                validator: Validator().email,
                onChanged: (value) => {},
                onSaved: (value) =>
                    authController.signUpEmailController.text = value!,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldForm(
                controller: authController.signUpPasswordController,
                iconPrefix: Icons.lock,
                labelText: 'auth_hint_password'.tr,
                keyboardType: TextInputType.visiblePassword,
                validator: Validator().password,
                onChanged: (value) => {},
                onSaved: (value) =>
                    authController.signUpPasswordController.text = value!,
                textInputAction: TextInputAction.next,
                obscureText: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldForm(
                controller: authController.confirmPasswordController,
                iconPrefix: Icons.lock,
                labelText: 'auth_hint_confirm_password'.tr,
                keyboardType: TextInputType.visiblePassword,
                validator: Validator().confirmPassword,
                onChanged: (value) => {},
                onSaved: (value) =>
                    authController.confirmPasswordController.text = value!,
                obscureText: true,
                maxLines: 1,
                textInputAction: TextInputAction.done,
              ),
              // SizedBox(
              //   height: 11.h,
              // ),
              // CheckboxListTile(
              //   value: false,
              //   onChanged: (value) {},
              //   controlAffinity: ListTileControlAffinity.leading,
              //   title: const Text('Accept terms and conditions'),
              // ),
              SizedBox(
                height: 20.h,
              ),
              PrimaryButton(
                  labelText: 'auth_signup_next'.tr,
                  onClciked: () {
                    authController.signUpNext = true;
                    authController.update();
                    // if (_formKey.currentState!.validate()) {
                    //   authController.signUpNext = true;
                    //   authController.update();
                    // }
                  }),
            ],
          ),
        ),
      );

  // FROM WIDGET 2 FOR Age & Country...etc
  Widget formWidget2() => Stack(children: [
        Form(
          key: _formKey,
          child: Positioned(
              top: 250.h,
              left: 25.w,
              right: 25.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    style: GoogleFonts.comfortaa(
                        fontSize: 40.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CSCPicker(
                    layout: Layout.vertical,
                    disableCountry: false,
                    //defaultCountry: DefaultCountry.Canada,
                    countryDropdownLabel: "Select Country",
                    stateDropdownLabel: "Select State",
                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    onCountryChanged: (String? country) {
                      authController
                          .updateButtonClickStatus(false)
                          .then((value) {
                        authController.selectedCountry = country;
                        authController.isCountrySelected.value = true;
                        authController.update();
                        print('COUNTRY: $country');
                      });
                    },
                    onStateChanged: (String? state) {
                      authController
                          .updateButtonClickStatus(false)
                          .then((value) {
                        if (state == null || state == 'Select State') {
                          print('STATE: $state');
                          authController.isRegionSelected.value = false;
                          authController.update();
                        } else {
                          authController.selectedRegion = state;
                          authController.isRegionSelected.value = true;
                          authController.update();
                          print('STATE: $state');
                        }
                      });
                    },

                    ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                    dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1)),

                    ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border: Border.all(
                            color: AppColorsTheme.subtextBlack, width: 1)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(() => authController.isButtonRegisterClicked.value
                      ? authController.isCountrySelected.value
                          ? authController.isRegionSelected.value
                              ? const SizedBox()
                              : Text(
                                  'Select Region',
                                  style: fontAccent10Style,
                                )
                          : Text(
                              'Select Country',
                              style: fontAccent10Style,
                            )
                      : const SizedBox()),
                  SizedBox(
                    height: 21.h,
                  ),
                  Text(
                    'Gender',
                    style: fontBlack10Style,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                            title: const Text('Male'),
                            value: 'male',
                            activeColor: AppColorsTheme.accentColor,
                            groupValue: authController.signUpGender,
                            onChanged: (value) =>
                                authController.handleGenderChange(value!)),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                            title: const Text('Female'),
                            value: 'female',
                            activeColor: AppColorsTheme.accentColor,
                            groupValue: authController.signUpGender,
                            onChanged: (value) =>
                                authController.handleGenderChange(value!)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldForm(
                    controller: authController.ageController,
                    iconPrefix: Icons.badge,
                    labelText: 'auth_signup_age'.tr,
                    keyboardType: TextInputType.number,
                    validator: Validator().number,
                    onChanged: (value) => {},
                    onSaved: (value) =>
                        authController.ageController.text = value!,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  PrimaryButton(
                      labelText: 'auth_register'.tr,
                      onClciked: () async {
                        //authController.collectUserData();
                        authController
                            .updateButtonClickStatus(true)
                            .then((value) {
                          if (_formKey.currentState!.validate()) {
                            //authController.registerWithEmailAndPassword();

                            if (authController.isRegionSelected.value) {
                              if (authController.selectedRegion !=
                                  'Select State') {
                                print(
                                    'COUNTRY: ${authController.selectedCountry} \n REGION: ${authController.selectedRegion}');
                                authController.registerWithEmailAndPassword();
                              } else {
                                print('Region is not selected correctly');
                              }
                            } else {
                              print('Region is not selected correctly');
                            }
                          }
                        });
                      }),
                ],
              )),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.w, 50.h, 0, 0),
            child: IconButton(
                onPressed: () {
                  authController.signUpNext = false;
                  authController.update();
                },
                icon: Icon(
                  Icons.close,
                  color: AppColorsTheme.accentColor,
                  size: 50.r,
                )),
          ),
        ),
      ]);

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
                  'auth_existing_user'.tr,
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
