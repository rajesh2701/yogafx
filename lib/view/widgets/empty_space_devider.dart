import 'package:flutter/material.dart';

class EmptySpaceDevider extends StatelessWidget {
  const EmptySpaceDevider({super.key, this.height = 15, this.width = 15});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
