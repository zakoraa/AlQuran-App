import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cari",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 30, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 35,
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
    );
  }
}
