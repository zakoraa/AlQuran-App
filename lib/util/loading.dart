import 'package:al_quran/util/background_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingUtil extends StatelessWidget {
  const LoadingUtil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const BackgroundApp(),
            Center(
              child: Lottie.asset("assets/loading.json", width: 300),
            ),
          ],
        ),
      ),
    );
  }
}
