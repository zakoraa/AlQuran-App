import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:al_quran/theme/color.dart';
import 'package:al_quran/util/loading.dart';
import 'package:al_quran/viewModel/ayatFromSurah/ayat_from_surah_controller.dart';
import 'package:al_quran/widget/ayatFromSurah/ayat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/global/audio_play.dart';

class AyatFromSurahView extends StatelessWidget {
  const AyatFromSurahView({super.key, required this.item});

  final SurahAlQuran item;

  @override
  Widget build(BuildContext context) {
    AyatFromSurahController ayatFromSurahController =
        Get.put(AyatFromSurahController(surahId: item.surahId.obs));
    List<AyatAlQuran> ayatDataList = ayatFromSurahController.ayatDataList;
    return Obx(() => ayatFromSurahController.isLoading.value
        ? const LoadingUtil()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromARGB(255, 204, 254, 233),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                item.titleSurahIndonesia,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: CustomColor.textPrimaryColor, fontSize: 18),
              ),
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: CustomColor.textPrimaryColor,
                ),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: Text(
                    item.titleSurahArabic,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: CustomColor.textPrimaryColor, fontSize: 25),
                  ),
                ),
              ],
            ),
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        item.surahId == 1 || item.surahId == 9
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: Get.width,
                                      color: const Color.fromARGB(
                                          255, 176, 249, 219),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/bismillah.png",
                                          width: 250,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 2,
                                        width: Get.width,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 53, 242, 214),
                                                Color.fromARGB(
                                                    255, 118, 174, 254),
                                              ]),
                                        )),
                                  ],
                                ),
                              ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ayatDataList.length,
                          itemBuilder: (context, index) =>
                              AyatList(index: index),
                        ),
                      ],
                    ),
                  ),
                  const AudioPlay()
                ],
              ),
            ),
          ));
  }
}
