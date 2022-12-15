import 'package:get/get.dart';
import 'package:yogafx/model/utils/constants.dart';

class Validator {
  Validator();

  // NAME VALIDATOR
  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!.trim())) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  // COUNTRY VALIDATOR
  String? country(String? value) {
    if (value == null) {
      return 'validator.country'.tr;
    } else {
      return null;
    }
  }

  // REGION VALIDATOR
  String? region(String? value) {
    if (value == null) {
      return 'validator.region'.tr;
    } else {
      return null;
    }
  }

  //EMAIL VALIDATOR
  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!.trim())) {
      return 'validator.email'.tr;
    } else {
      return null;
    }
  }

  //PASSWORD VALIDATOR
  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!.trim())) {
      return 'validator.password'.tr;
    } else {
      return null;
    }
  }

  //CONFIRM PASSWORD VALIDATOR
  String? confirmPassword(String? value) {
    if (value != authController.signUpPasswordController.text) {
      return 'validator.password_notmatch'.tr;
    } else {
      return null;
    }
  }

  String? number(String? value) {
    // String pattern = r'\b([1-9][0-9])\b';
    // String sampleCopy = ^([0-9]|[1-9][0-9]|100)$
    //  String pattern = r'\b([1-9][0-9]+$)\b';
    String pattern = r'^([1-9][0-9])$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    String pattern = r'^\d+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    String pattern = r'^\S+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.notEmpty'.tr;
    } else {
      return null;
    }
  }

  // TERMS CHECKED VALIDATOR
  String? terms(bool? value) {
    if (value!) {
      return null;
    } else {
      return 'please select terms';
    }
  }
}
