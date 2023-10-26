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
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                offset: Offset(0, 3),
                color: CustomColor.shadowColor)
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF34B3AA), CustomColor.primaryColor])),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Image.asset(
                      "assets/logo_alquran.png",
                    )),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Yuk Baca \nAl-Qur'an!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
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
