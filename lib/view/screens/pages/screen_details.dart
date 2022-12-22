import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/model/model.dart';
import 'package:yogafx/view/view.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key, required this.bodyPartName});

  final String bodyPartName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          bodyPartName,
          style: fontWhite15Style,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset(
                AssetPath.muscleFront,
                width: 390.w,
                height: 260.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              bodyPartName,
              style: detailScreenPartName,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            const ExpansionTileWidget(
              title: 'Common Problems',
              childText:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.',
            ),
            const ExpansionTileWidget(
              title: 'Causes',
              childText:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.',
            ),
            const ExpansionTileWidget(
              title: 'Solution',
              childText:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.',
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 600.h,
              child: GridView.extent(
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 200.0,
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    color: Colors.teal,
                    width: 100,
                    height: 100,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
