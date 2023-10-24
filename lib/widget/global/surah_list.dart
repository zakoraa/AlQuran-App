import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:al_quran/view/surah_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color.dart';

class SurahList extends StatelessWidget {
  const SurahList({super.key, required this.index, required this.items});

  final int index;
  final List<SurahAlQuran> items;
  @override
  Widget build(BuildContext context) {
    final item = items[index];
    return GestureDetector(
      onTap: () => Get.to(
          () => SurahDetailView(
              surahId: item.surahId, surahName: item.titleSurahIndonesia),
          transition: Transition.rightToLeft),
      child: Container(
        color: Colors.transparent,
        width: Get.width,
        child: Column(
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
                            color: CustomColor.textsecondaryColor,
                            fontSize: 12))
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
            Container(
              height: 1,
              width: Get.width,
              color: const Color.fromARGB(255, 142, 180, 186),
            )
          ],
        ),
      ),
    );
  }
}
