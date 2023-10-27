import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:al_quran/viewModel/surahView/surah_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewModel/audio/audio_controller.dart';

class TafsirButton extends StatelessWidget {
  const TafsirButton({
    super.key,
    required this.item,
 
  });

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    SurahController surahController = Get.find<SurahController>();
    return GetBuilder<AudioController>(
        builder: (_) => Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 183, 151, 234),
                        Color.fromARGB(255, 231, 175, 208),
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
                  onTap: () => item is SurahAlQuran?  surahController.showTafsir(
                      context, item.titleSurahIndonesia, item.interpretation, "Surah"): surahController.showTafsir(
                      context, item.ayatNumber, item.interpretation, "Ayat ke"),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: Get.width,
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lihat Tafsiran",
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
                        ],
                      )),
                ),
              ),
            ));
  }
}
