import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color.dart';
import 'background_app.dart';

class NoInternetUtil extends StatelessWidget {
  const NoInternetUtil({super.key});

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
                    height: 250,
                    width: 250,
                    child: Image.asset("assets/no_internet.png", width: 250)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Tidak ada koneksi",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: CustomColor.textsecondaryColor, fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
