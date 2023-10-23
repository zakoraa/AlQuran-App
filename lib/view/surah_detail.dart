import 'package:al_quran/theme/color.dart';
import 'package:al_quran/widget/global/ayat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahDetailView extends StatelessWidget {
  const SurahDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 204, 254, 233),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Surah Al-Fatihah",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: CustomColor.textPrimaryColor, fontSize: 20),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: CustomColor.textPrimaryColor,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) => const AyatList(),
      ),
    );
  }
}
