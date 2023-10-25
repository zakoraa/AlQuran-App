import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color.dart';

class SurahList extends StatelessWidget {
  const SurahList({super.key, required this.item});

  final SurahAlQuran item;
  @override
  Widget build(BuildContext context) {
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
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 118, 174, 254),
                          Color.fromARGB(255, 53, 242, 214),
                        ]),
                    borderRadius: BorderRadius.circular(5)),
                child: Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Matikan Audio",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 244, 243, 243)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.play_arrow,
                        color: Color.fromARGB(255, 244, 243, 243),
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 1,
            width: Get.width,
            color: const Color.fromARGB(255, 142, 180, 186),
          )
        ],
      ),
    );
  }
}
