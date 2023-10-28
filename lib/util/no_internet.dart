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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: CustomColor.textsecondaryColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 117, 168, 239),
                              Color.fromARGB(255, 75, 235, 211),
                            ]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Material(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                        child: InkWell(
                            splashColor: Colors.transparent,
                            overlayColor: const MaterialStatePropertyAll(
                              Color.fromARGB(112, 117, 168, 239),
                            ),
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  "Kembali",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 244, 243, 243)),
                                ),
                              ),
                            ))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
