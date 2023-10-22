import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 200,
        width: 100,
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
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/al_quran.png",
                width: 100,
              ),
              Row(
                children: [
                  Text(
                    "Surah",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 28,
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
