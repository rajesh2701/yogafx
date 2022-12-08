import 'package:flutter/material.dart';
import 'package:yogafx/view/view.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontSize: 25, color: AppColorsTheme.black),
        ),
      ),
    );
  }
}
