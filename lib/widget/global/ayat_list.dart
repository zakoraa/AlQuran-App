import 'package:al_quran/viewModel/surahDetail/surah_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/ayat_al_quran_model.dart';
import '../../theme/color.dart';

class AyatList extends StatelessWidget {
  const AyatList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    SurahDetailController surahDetailController =
        Get.find<SurahDetailController>();
    List<AyatAlQuran> dataList = surahDetailController.ayatDataList;
    final data = dataList[index];
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
                          "${data.ayatNumber}",
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
                    data.arabicAyat,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: "Arab", fontSize: 25),
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
                data.latinAyat,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: CustomColor.secondaryColor,
                    fontSize: 16,
                    fontFamily: "normal"),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data.ayatTranslation,
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
        Container(
          height: 1,
          width: Get.width,
          color: const Color.fromARGB(255, 142, 180, 186),
        ),
      ],
    );
  }
}
