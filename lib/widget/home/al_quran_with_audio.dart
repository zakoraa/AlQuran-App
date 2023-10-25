import 'package:al_quran/view/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';

class AlQuranWithAudioCard extends StatelessWidget {
  const AlQuranWithAudioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const SurahView(isAudio: true)),
      child: Container(
        height: 150,
        width: Get.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                  color: CustomColor.shadowColor)
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFFA686DA), Color(0xFFC688C9)])),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Al-Qur'an",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "Dengan Audio",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
              Image.asset(
                "assets/kaligrafi.png",
                width: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
