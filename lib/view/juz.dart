import 'package:al_quran/theme/color.dart';
import 'package:al_quran/widget/global/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/surah_al_quran_model.dart';
import '../viewModel/search/search_controller.dart';

class JuzView extends StatelessWidget {
  const JuzView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchViewController searchController = Get.put(SearchViewController());
    List<SurahAlQuran> items = searchController.searchResults!;
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
                          itemCount: 30,
                          itemBuilder: (context, index) => Container(
                            color: Colors.transparent,
                            width: Get.width,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      height: 80,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Center(
                                            child: Stack(children: [
                                              Image.asset(
                                                  "assets/bg_number.png"),
                                              Center(
                                                child: Text(
                                                  "${index + 1}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: CustomColor
                                                              .secondaryVariantColor,
                                                          fontSize: 10),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Juz ${index + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 0, 84, 82),
                                              fontSize: 18),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  width: Get.width,
                                  color:
                                      const Color.fromARGB(255, 142, 180, 186),
                                )
                              ],
                            ),
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
