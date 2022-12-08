import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.labelText,
      required this.onClciked,
      this.color = const Color(0xFF6EBE45)});

  final String labelText;
  final void Function() onClciked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20.r),
      color: color,
      child: InkWell(
        onTap: onClciked,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          alignment: Alignment.center,
          height: 50.h,
          width: 200.w,
          child: Text(
            labelText.toUpperCase(),
            style: GoogleFonts.comfortaa(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Material(
  //     elevation: 5,
  //     borderRadius: BorderRadius.circular(10),
  //     color: color,
  //     child: MaterialButton(
  //       onPressed: onClciked,
  //       padding: EdgeInsets.fromLTRB(4.h, 2.h, 4.h, 2.h),
  //       child: Text(
  //         labelText.toUpperCase(),
  //         style: TextStyle(
  //             fontSize: 16.sp,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white),
  //       ),
  //     ),
  //   );
  // }
}
