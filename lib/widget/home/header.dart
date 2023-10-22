import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../theme/color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2, offset: Offset(0, 3), color: Color(0xFF296452))
          ],
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF34B3AA), CustomColor.primaryColor])),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assalamualaikum",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Temen-temen",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Yuk Baca \nAl-Qur'an!",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 3, child: Lottie.asset("assets/header_lottie.json"))
        ],
      ),
    );
  }
}
