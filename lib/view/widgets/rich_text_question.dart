import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/model/model.dart';

class RichTextQuestion extends StatelessWidget {
  const RichTextQuestion(
      {super.key,
      required this.textQuestion,
      required this.linkText,
      required this.onClick});

  final String textQuestion;
  final String linkText;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.h, bottom: 25.h),
          child: GestureDetector(
            onTap: onClick,
            child: RichText(
              text: TextSpan(
                  text: '$textQuestion ',
                  style: fontBlack10Style,
                  children: [
                    TextSpan(text: linkText, style: fontAccent10Style)
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
