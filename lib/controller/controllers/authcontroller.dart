import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> firebaseUser = Rxn<User>();

  String? errorMessage;

  bool isLoading = false;

  RxString userNameToDisplay = ''.obs;

  //TEXT EDITING CONTROLLERS
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNamwController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailPasswordResetController =
      TextEditingController();

  bool signUpNext = false;
  String signUpGender = 'male';
  String? selectedCountry;
  String? selectedRegion;
  RxBool isCountrySelected = false.obs;
  RxBool isRegionSelected = false.obs;
  RxBool isButtonRegisterClicked = false.obs;
  List<String> formCountries = ['United States', 'Canada', 'France', 'India'];
  List<String> formRegions = [
    'Region 1',
    'Region 2',
    'Region 3',
    'Region 4',
    'Region 5',
    'Region 6',
    'Region 7',
    'Region 8'
  ];

  @override
  void onReady() {
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    userNameToDisplay.value =
        Settings.getValue('pref-userName', defaultValue: '')!;

    super.onReady();
  }

  // SIGN UP SCREEN GENDER SELECTION
  void handleGenderChange(String value) {
    signUpGender = value;
    update();
  }

  // Firebase user a realtime stream
  Stream<User?> get user => firebaseAuth.authStateChanges();

  handleAuthChanged(firebaseUser) async {
    final bool isRegistred =
        Settings.getValue('isRegistred', defaultValue: false)!;

    if (isRegistred) {
      if (firebaseUser == null) {
        Get.offAll(() => const SplashScreen());
      } else {
        //getUserName();
        Get.offAll(() => const ScreenHome());
      }
    } else {
      if (firebaseUser == null) {
        Get.offAll(() => const SplashScreen());
      } else {
        //getUserName();
        Get.offAll(() => const ScreenHome());
      }
    }
  }

  // SIGNING IN WITH EMAIL AND PASSWORD
  signInWithEmailAndPassword(BuildContext context) async {
    _loadingProgress(true);
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passWordController.text)
          .whenComplete(() => _loadingProgress(false))
          .then((uid) {
        emailController.clear();
        passWordController.clear();
        // SAVE USER NAME HERE
        saveUserNameOnLogin(uid.user!.uid);
        GetSnackbarHelper.showGetSnackbar(
            title: 'auth_success'.tr,
            message: 'auth_success_login'.tr,
            snackPosition: SnackPosition.TOP);
      });
    } on FirebaseAuthException catch (error) {
      _loadingProgress(false);
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'auth_check_invalid_email'.tr;
          break;
        case 'wrong-password':
          errorMessage = 'auth_check_wrong_password'.tr;
          break;
        case 'user-not-found':
          errorMessage = 'auth_check_user_not_found'.tr;
          break;
        case 'user-disabled':
          errorMessage = 'auth_check_user_disabled'.tr;
          break;
        case 'too-many-requests':
          errorMessage = 'auth_check_too_many_requests'.tr;
          break;
        case 'operation-not-allowed':
          errorMessage = 'auth_check_operation_not_allowed'.tr;
          break;
        default:
          errorMessage = 'auth_check_undefined_error'.tr;
      }
      GetSnackbarHelper.showGetSnackbar(
          title: 'auth_error'.tr,
          message: errorMessage!,
          snackPosition: SnackPosition.TOP);
    }
  }

  // SIGN UP WITH EMAIL AND PASSWORD
  registerWithEmailAndPassword() async {
    _loadingProgress(true);
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: signUpEmailController.text.trim(),
              password: signUpPasswordController.text)
          .whenComplete(() => {_loadingProgress(false)})
          .then((result) async => {
                await collectUserData().then((userModel) {
                  postUserDetailsToFirestore(userModel);
                }).then((value) {
                  clearRegistrationFields();
                })
              });
    } on FirebaseAuthException catch (error) {
      _loadingProgress(false);
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'auth_check_invalid_email'.tr;
          break;
        case 'wrong-password':
          errorMessage = 'auth_check_wrong_password'.tr;
          break;
        case 'user-not-found':
          errorMessage = 'auth_check_user_not_found'.tr;
          break;
        case 'user-disabled':
          errorMessage = 'auth_check_user_disabled'.tr;
          break;
        case 'too-many-requests':
          errorMessage = 'auth_check_too_many_requests'.tr;
          break;
        case 'operation-not-allowed':
          errorMessage = 'auth_check_operation_not_allowed'.tr;
          break;
        default:
          errorMessage = 'auth_check_undefined_error'.tr;
      }
      GetSnackbarHelper.showGetSnackbar(
          title: 'auth_error'.tr,
          message: errorMessage!,
          snackPosition: SnackPosition.TOP);
    }
  }

  // ADD DETAILS TO FIRESTORE USER
  postUserDetailsToFirestore(UserModel userModel) async {
    User? user = firebaseAuth.currentUser;

    // writing all the values
    userModel.uid = user!.uid;

    // SAVE USER NAME TO PREFS
    saveUserNameOnRegister(userModel.userFirstName);

    FireStoreDatabase.saveUserInfo(userModel);

    //FireStoreDB.saveUserInfo(user.uid, userModel);
    //FireStoreDB.saveChallengesList(user);

    GetSnackbarHelper.showGetSnackbar(
        title: 'auth_success'.tr,
        message: 'auth_success_register'.tr,
        snackPosition: SnackPosition.TOP);

    Get.offAll(() => const ScreenHome());
  }

  // LOGOUT THE USER
  void signOut() async {
    _loadingProgress(true);
    Settings.setValue('pref-userName', 'User');
    await firebaseAuth.signOut().whenComplete(() => _loadingProgress(false));
  }

  // COLLECT USER DETAILS TO SAVE
  Future<UserModel> collectUserData() async {
    String userEmail = signUpEmailController.text.trim();
    String userFirstName = firstNameController.text.trim();
    String userLastName = secondNamwController.text.trim();
    int userAge = int.parse(ageController.text.trim());
    bool userGender = signUpGender == 'male' ? true : false;

    return UserModel(
        uid: '',
        userEmail: userEmail,
        userFirstName: userFirstName,
        userLastName: userLastName,
        userAge: userAge,
        userCountry: selectedCountry!,
        userRegion: selectedRegion!,
        isUserMale: userGender);
  }

  // CLEAR CONTROLLERS
  clearRegistrationFields() {
    signUpNext = false;
    firstNameController.clear();
    secondNamwController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    confirmPasswordController.clear();
    ageController.clear();
    isCountrySelected.value = false;
    isRegionSelected.value = false;
    update();
  }

  // Loading Progress
  void _loadingProgress(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }

  // SAVE USER NAME IN PREFRENCES
  saveUserNameOnLogin(String userID) async {
    await FireStoreDatabase.getUserName(userID).then((value) async {
      userNameToDisplay.value = value;
      await Settings.setValue('pref-userName', value);
      update();
    });
  }

  saveUserNameOnRegister(String userName) {
    userNameToDisplay.value = userName;
    Settings.setValue('pref-userName', userName);
    update();
  }

  Future<void> updateButtonClickStatus(bool buttonClick) async {
    isButtonRegisterClicked.value = buttonClick;
    update();
  }
}
