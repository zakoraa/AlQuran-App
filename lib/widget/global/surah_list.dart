import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:al_quran/viewModel/audio/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color.dart';

class SurahList extends StatelessWidget {
  const SurahList({
    super.key,
    required this.item,
  });

  final SurahAlQuran item;
  @override
  Widget build(BuildContext context) {
    AudioController audioController = Get.find<AudioController>();
    String audio = "${item.audio.substring(0, 4)}s${item.audio.substring(4)}";
    return Container(
      color: Colors.transparent,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                height: 100,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Stack(children: [
                        Image.asset("assets/bg_number.png"),
                        Center(
                          child: Text(
                            "${item.surahId}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: CustomColor.secondaryVariantColor,
                                    fontSize: 10),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.titleSurahIndonesia,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 0, 84, 82),
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "${item.placeOfRevelation}  •  ${item.numberOfAyat} Ayat",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: CustomColor.textsecondaryColor, fontSize: 12))
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.titleSurahArabic,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: CustomColor.secondaryVariantColor,
                          fontFamily: "Arab",
                          fontSize: 25),
                    )),
              ))
            ],
          ),
          GetBuilder<AudioController>(
              builder: (_) => audioController.isAudio.value
                  ? Container(
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
                          onTap: audioController.isPlaying.value || audioController.isLoading.value
                              ? () {}
                              : () async {
                                  await audioController.playAudio(item, audio);
                                },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            width: Get.width,
                            color: Colors.transparent,
                            child: audioController.isLoading.value
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
      ),
    );
  }
}
