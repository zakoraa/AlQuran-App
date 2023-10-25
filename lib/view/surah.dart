import 'package:al_quran/theme/color.dart';
import 'package:al_quran/viewModel/home/home_controller.dart';
import 'package:al_quran/viewModel/search/search_surah_controller.dart';
import 'package:al_quran/viewModel/surah/surah_controller.dart';
import 'package:al_quran/widget/global/custom_textfield.dart';
import 'package:al_quran/widget/global/surah_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/surah_al_quran_model.dart';
import 'ayat_from_surah.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, this.isTafsir = false});

  final bool isTafsir;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    SearchSurahController searchController =
        Get.put(SearchSurahController(homeController: homeController));
    List<SurahAlQuran> items = searchController.searchResults!;
    SurahController surahController = Get.put(SurahController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.backgroundColor,
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
                      child: GetBuilder<SearchSurahController>(
                        builder: (_) => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              SurahAlQuran item = items[index];

                              return GestureDetector(
                                onTap: () => isTafsir
                                    ? surahController.showTafsir(
                                        context,
                                        item.titleSurahIndonesia,
                                        item.interpretation)
                                    : Get.to(
                                        () => AyatFromSurahView(
                                              surahId: item.surahId,
                                              surahName:
                                                  item.titleSurahIndonesia,
                                              preBismillah: item.preBismillah,
                                            ),
                                        transition: Transition.rightToLeft),
                                child: SurahList(
                                  item: items[index],
                                ),
                              );
                            }),
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
