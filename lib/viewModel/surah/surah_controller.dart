import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/alert_dialog.dart';

class SurahController extends GetxController {
  void showTafsir(
      BuildContext context, String titleSurah, String tafsirContent) {
    AlertDialogUtils.showDialogUtils(context,
        title: Text(
          "Tafsir Surah $titleSurah",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
        content: Text(
          tafsirContent,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 118, 174, 254),
                        Color.fromARGB(255, 53, 242, 214),
                      ]),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Close",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          )
        ]);
  }
}
