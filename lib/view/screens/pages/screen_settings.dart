import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/model/model.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Icon(
                Icons.person_rounded,
                size: 194.r,
              ),
              Divider(
                thickness: 1.h,
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  size: 25.r,
                ),
                title: Text(
                  'Privacy Policy',
                  style: detailScreenTitle,
                ),
              ),
              Divider(
                thickness: 1.h,
              ),
              ListTile(
                leading: Icon(
                  Icons.security,
                  size: 25.r,
                ),
                title: Text(
                  'Terms of Service',
                  style: detailScreenTitle,
                ),
              ),
              Divider(
                thickness: 1.h,
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  size: 25.r,
                ),
                title: Text(
                  'Privacy Policy',
                  style: detailScreenTitle,
                ),
              ),
              Divider(
                thickness: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
