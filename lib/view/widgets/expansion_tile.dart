import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/model/model.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget(
      {Key? key, required this.title, this.childText = ''})
      : super(key: key);

  final String title;
  final String childText;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: detailScreenTitle,
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
          child: Text(
            childText,
            textAlign: TextAlign.justify,
            style: detailScreenText,
          ),
        )
      ],
    );
  }
}
