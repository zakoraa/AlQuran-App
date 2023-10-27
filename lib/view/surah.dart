import 'package:al_quran/theme/color.dart';
import 'package:al_quran/util/loading.dart';
import 'package:al_quran/viewModel/audio/audio_controller.dart';
import 'package:al_quran/viewModel/surahView/surah_controller.dart';
import 'package:al_quran/widget/global/audio_play.dart';
import 'package:al_quran/widget/global/custom_textfield.dart';
import 'package:al_quran/widget/surah/surah_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/surah_al_quran_model.dart';
import 'ayat_from_surah.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, this.isTafsir = false, this.isAudio = false});

  final bool isTafsir, isAudio;

  @override
  Widget build(BuildContext context) {
    AudioController audioController = Get.find<AudioController>();
    audioController.isAudio.value = isAudio;
    SurahController surahController =
        Get.put(SurahController(), permanent: true);
    return Obx(() => surahController.isLoading.value
        ? const LoadingUtil()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: CustomColor.backgroundColor,
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Image.asset("assets/bg_surah.png"),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 30,
                                color: CustomColor.textPrimaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/logo_alquran.png",
                            width: 200,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomTextField(),
                          const SizedBox(
                            height: 10,
                          ),
                          surahController.searchResults!.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text("Tidak ada hasil",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: CustomColor
                                                  .textsecondaryColor)),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount:
                                          surahController.searchResults!.length,
                                      itemBuilder: (context, index) {
                                        SurahAlQuran item = surahController
                                            .searchResults![index];
                                        return GestureDetector(
                                          onTap: () => isTafsir
                                              ? surahController.showTafsir(
                                                  context,
                                                  item.titleSurahIndonesia,
                                                  item.interpretation)
                                              : audioController.isShown.value &&
                                                      isAudio
                                                  ? () {}
                                                  : Get.to(
                                                      () => AyatFromSurahView(
                                                          item: item),
                                                      transition: Transition
                                                          .rightToLeft),
                                          child: SurahList(
                                            item: item,
                                          ),
                                        );
                                      }),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const AudioPlay()
                ],
              ),
            ),
          ));
  }
}
