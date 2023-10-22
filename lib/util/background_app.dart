import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            CustomColor.primaryColor,
            Color.fromARGB(255, 102, 247, 184),
            Color.fromARGB(255, 180, 255, 223),
            Colors.white,
            Colors.white,
          ])),
    );
  }
}
