import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';

class AyatList extends StatelessWidget {
  const AyatList({super.key});

  @override
  Widget build(BuildContext context) {
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
                          "114",
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
                    "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِي الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِي",
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
                "Latinnya loresm ispus halllo bang ini latinnya",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: CustomColor.secondaryColor, fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "artinya loresm ispus halllo bang ini artinya",
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
