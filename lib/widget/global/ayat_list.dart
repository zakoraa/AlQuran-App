import 'package:al_quran/viewModel/ayatFromSurah/ayat_from_surah_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/ayat_al_quran_model.dart';
import '../../theme/color.dart';
import '../../viewModel/audio/audio_controller.dart';

class AyatList extends StatelessWidget {
  const AyatList({
    super.key,
    required this.index,
    this.isAudio = true,
  });

  final int index;
  final bool isAudio;

  @override
  Widget build(BuildContext context) {
    AyatFromSurahController ayatFromSurahController =
        Get.find<AyatFromSurahController>();
    AudioController audioController = Get.find<AudioController>();
    List<AyatAlQuran> itemList = ayatFromSurahController.ayatDataList;
    audioController.ayatList = itemList;
    final AyatAlQuran item = itemList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: 50,
                  width: 50,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        "assets/bg_number.png",
                        fit: BoxFit.contain,
                        width: 50,
                      ),
                      Center(
                        child: Text(
                          "${item.ayatNumber}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    item.arabicAyat,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: "Arab", fontSize: 26, height: 2.5),
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 55, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.latinAyat,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: CustomColor.secondaryColor,
                    fontSize: 16,
                    fontFamily: "normal"),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item.ayatTranslation,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<AudioController>(
            builder: (_) => audioController.isAudio.value
                ? Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 117, 168, 239),
                            Color.fromARGB(255, 75, 235, 211),
                          ]),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        overlayColor: const MaterialStatePropertyAll(
                          Color.fromARGB(112, 117, 168, 239),
                        ),
                        onTap: audioController.isPlaying.value || audioController.isLoading.value
                            ? () {}
                            : () async {
                                await audioController.playAudio(
                                    item, item.audio);
                              },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          width: Get.width,
                          color: Colors.transparent,
                          child: audioController.isLoading.value
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.isPlaying
                                          ? "Sebentar ya..."
                                          : "Audio",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: const Color.fromARGB(
                                                  255, 244, 243, 243)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    item.isPlaying
                                        ? const SizedBox.shrink()
                                        : const Icon(
                                            Icons.play_arrow,
                                            color: Color.fromARGB(
                                                255, 244, 243, 243),
                                            size: 20,
                                          ),
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.isPlaying
                                          ? "Sedang diputar..."
                                          : "Audio",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: const Color.fromARGB(
                                                  255, 244, 243, 243)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    item.isPlaying
                                        ? const SizedBox.shrink()
                                        : const Icon(
                                            Icons.play_arrow,
                                            color: Color.fromARGB(
                                                255, 244, 243, 243),
                                            size: 20,
                                          ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()),
      ],
    );
  }
}
