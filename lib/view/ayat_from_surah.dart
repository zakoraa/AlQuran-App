import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:al_quran/theme/color.dart';
import 'package:al_quran/util/loading.dart';
import 'package:al_quran/util/no_internet.dart';
import 'package:al_quran/viewModel/audio/audio_controller.dart';
import 'package:al_quran/viewModel/ayatFromSurahView/ayat_from_surah_controller.dart';
import 'package:al_quran/widget/ayatFromSurah/ayat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widget/global/audio_play.dart';

class AyatFromSurahView extends StatelessWidget {
  const AyatFromSurahView(
      {super.key, required this.item, required this.isTafsir});

  final SurahAlQuran item;
  final bool isTafsir;

  @override
  Widget build(BuildContext context) {
    AyatFromSurahController ayatFromSurahController =
        Get.put(AyatFromSurahController(surahId: item.surahId.obs));
    List<AyatAlQuran> ayatDataList = ayatFromSurahController.ayatDataList;
    AudioController audioController = Get.find<AudioController>();
    bool isBismillah = !(item.surahId == 1 || item.surahId == 9);

    bool isAudioPlaying(int index) {
      bool boxIsShown = audioController.isShown.value;
      bool isValid =
          index == ayatDataList.length - 1 && audioController.isAudio.value;
      return isValid && boxIsShown;
    }

    return Obx(() => ayatFromSurahController.isLoading.value
        ? const LoadingUtil()
        : !ayatFromSurahController.isSuccess.value
            ? const NoInternetUtil()
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15),
                      child: Text(
                        item.titleSurahArabic,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: CustomColor.textPrimaryColor, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                body: SizedBox(
                  width: Get.width,
                  child: Stack(
                    children: [
                      GetBuilder<AudioController>(
                        builder: (_) => ScrollablePositionedList.builder(
                            physics: audioController.isShown.value
                                ? const AlwaysScrollableScrollPhysics()
                                : const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemScrollController:
                                audioController.itemScrollController,
                            itemCount: ayatDataList.length,
                            itemBuilder: (context, index) => isBismillah
                                ? Column(
                                    children: [
                                      index != 0
                                          ? const SizedBox.shrink()
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
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
                                                    height: 1,
                                                    width: Get.width,
                                                    color: const Color.fromARGB(
                                                        255, 142, 180, 186),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      AyatList(
                                          index: index, isTafsir: isTafsir),
                                      isAudioPlaying(index)
                                          ? const SizedBox(
                                              height: 100,
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  )
                                : Column(
                                    children: [
                                      AyatList(
                                          index: index, isTafsir: isTafsir),
                                      isAudioPlaying(index)
                                          ? const SizedBox(
                                              height: 100,
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  )),
                      ),
                      const AudioPlay()
                    ],
                  ),
                ),
              ));
  }
}
