import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color.dart';
import '../../view/surah.dart';

class AlQuranCard extends StatelessWidget {
  const AlQuranCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => const SurahView(), transition: Transition.rightToLeft),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0, 3),
                  color: CustomColor.shadowColor)
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF87E9DA),
                  Color(0xFFA1C5F6),
                ])),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: Image.asset(
                    "assets/al_quran_2.png",
                    width: 100,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Al-Qur'an",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 3,
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
