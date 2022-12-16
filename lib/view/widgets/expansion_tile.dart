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
        style: fontBlack15Style,
      ),
      children: [
        Card(
          elevation: 4.h,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              childText,
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ],
    );
  }
}
