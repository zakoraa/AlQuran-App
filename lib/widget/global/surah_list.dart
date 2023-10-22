import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/al_quran_model.dart';
import '../../theme/color.dart';

class SurahList extends StatelessWidget {
  const SurahList({super.key, required this.index, required this.items});

  final int index;
  final List<AlQuran> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: 80,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: CustomColor.primaryColor),
                  child: Center(
                    child: Text(
                      "${items[index].surah}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].titleSurahIndonesia,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 0, 84, 82),
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    "${items[index].placeOfRevelation}  •  ${items[index].ayat} Ayat",
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
                    items[index].titleSurahArabic,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: CustomColor.primaryColor,
                        fontFamily: "Arab",
                        fontSize: 25),
                  )),
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 1,
            width: Get.width,
            color: const Color.fromARGB(255, 212, 212, 212),
          ),
        )
      ],
    );
  }
}
