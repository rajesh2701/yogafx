import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yogafx/view/view.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm(
      {Key? key,
      required this.controller,
      required this.iconPrefix,
      required this.labelText,
      required this.validator,
      required this.textInputAction,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines,
      required this.onChanged,
      required this.onSaved})
      : super(key: key);

  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int? maxLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: Icon(
            iconPrefix,
            color: AppColorsTheme.accentColor,
            size: 20.h,
          ),
          fillColor: const Color.fromRGBO(217, 217, 217, 1),
          contentPadding: EdgeInsets.fromLTRB(5.h, 2.h, 5.h, 2.h),
          labelText: labelText,
          labelStyle: GoogleFonts.comfortaa(
              color: AppColorsTheme.subtextBlack, fontSize: 16.sp),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(width: 0.8.h)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColorsTheme.subtextBlack, width: 0.5),
              borderRadius: BorderRadius.circular(20.r)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColorsTheme.accentColor, width: 1.h),
              borderRadius: BorderRadius.circular(20.r))),
    );
  }
}
