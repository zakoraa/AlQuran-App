import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../theme/color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF76EBAC),
              CustomColor.primaryColor,
            ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Assalamualaikum",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontSize: 25),
          ),
          Text(
            "Temen-temen",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yuk Baca",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Al-Quran!",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white, fontSize: 28),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 4, child: Lottie.asset("assets/header_lottie.json")),
            ],
          ),
        ],
      ),
    );
  }
}
