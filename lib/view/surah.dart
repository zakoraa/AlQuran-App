import 'package:al_quran/theme/color.dart';
import 'package:al_quran/widget/global/custom_textfield.dart';
import 'package:al_quran/widget/global/surah_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/al_quran_model.dart';
import '../viewModel/search/search_controller.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchViewController searchController = Get.put(SearchViewController());
    List<AlQuran> items = searchController.searchResults!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 204, 254, 233),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Image.asset("assets/bg_surah.png"),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 30,
                          color: CustomColor.textPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/logo_alquran.png",
                      width: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomTextField(),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GetBuilder<SearchViewController>(
                        builder: (_) => ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) => SurahList(
                            index: index,
                            items: items,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
