import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';
import '../../view/surah.dart';

class TafsirCard extends StatelessWidget {
  const TafsirCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const SurahView(isTafsir: true),
          transition: Transition.rightToLeft),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                  color: CustomColor.shadowColor)
            ],
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFFDE88AD), Color(0xFFE2A8CB)])),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                transform: Matrix4.translationValues(0, -25, 0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/al_quran.png",
                    width: 140,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Tafsir",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 23, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 25,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
