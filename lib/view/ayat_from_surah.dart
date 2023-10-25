import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:al_quran/theme/color.dart';
import 'package:al_quran/util/loading.dart';
import 'package:al_quran/viewModel/ayatFromSurah/ayat_from_surah_controller.dart';
import 'package:al_quran/widget/global/ayat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyatFromSurahView extends StatelessWidget {
  const AyatFromSurahView(
      {super.key,
      required this.surahId,
      required this.surahName,
      required this.preBismillah});

  final int surahId;
  final String surahName;
  final dynamic preBismillah;

  @override
  Widget build(BuildContext context) {
    AyatFromSurahController ayatFromSurahController =
        Get.put(AyatFromSurahController(surahId: surahId.obs));
    List<AyatAlQuran> ayatDataList = ayatFromSurahController.ayatDataList;
    return Obx(() => ayatFromSurahController.isLoading.value
        ? const LoadingUtil()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromARGB(255, 204, 254, 233),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                surahName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: CustomColor.textPrimaryColor, fontSize: 20),
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
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  preBismillah == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                width: Get.width,
                                color: const Color.fromARGB(255, 31, 202, 128),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: Get.width,
                                color: const Color.fromARGB(255, 176, 249, 219),
                                child: Center(
                                  child: Image.asset(
                                    "assets/bismillah.png",
                                    width: 250,
                                  ),
                                ),
                              ),
                              Container(
                                height: 3,
                                width: Get.width,
                                color: const Color.fromARGB(255, 31, 202, 128),
                              ),
                            ],
                          ),
                        ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ayatDataList.length,
                    itemBuilder: (context, index) => AyatList(index: index),
                  ),
                ],
              ),
            ),
          ));
  }
}
