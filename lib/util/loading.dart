import 'package:al_quran/theme/color.dart';
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
          alignment: Alignment.center,
          children: [
            const BackgroundApp(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 300,
                    width: 300,
                    child: Lottie.asset("assets/loading.json", width: 300)),
                Text(
                  "Loading...",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: CustomColor.textPrimaryColor, fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
