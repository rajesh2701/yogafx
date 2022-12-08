import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          authController.signUpNext ? formContainer2() : formContainer1()
        ],
      );

  //USER DETAILS NAME, EMAIL, PASSWORD
  Widget formContainer1() => Positioned(
        left: 25.w,
        right: 25.w,
        top: 181.h,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const LogoHeader(),
                    const SizedBox(
                      height: 45,
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
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldForm(
                      controller: authController.secondNamwController,
                      iconPrefix: Icons.person,
                      labelText: 'auth_hint_lastname'.tr,
                      keyboardType: TextInputType.name,
                      validator: Validator().name,
                      onChanged: (value) => {},
                      onSaved: (value) =>
                          authController.secondNamwController.text = value!,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 15,
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
                    const SizedBox(
                      height: 15,
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
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldForm(
                      controller: authController.confirmPasswordController,
                      iconPrefix: Icons.lock,
                      labelText: 'auth_hint_confirm_password'.tr,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validator().confirmPassword,
                      onChanged: (value) => {},
                      onSaved: (value) => authController
                          .confirmPasswordController.text = value!,
                      obscureText: true,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 15,
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
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  //USER DATA LIKE AGE COUNTRY...
  Widget formContainer2() => Stack(
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: Text(
                          'USER DETAILS',
                          style: fontAccent15Style,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 15,
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
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(
                        height: 5,
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
                      const SizedBox(
                        height: 25,
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
                                    authController
                                        .registerWithEmailAndPassword();
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
              )),
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
                    size: 30,
                  )),
            ),
          ),
          const Center(
            child: ProgressBarText(loadingText: 'Registring...'),
          )
        ],
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
