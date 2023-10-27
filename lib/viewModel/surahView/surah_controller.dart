import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/surah_al_quran_model.dart';
import '../../util/alert_dialog.dart';
import '../surahData/surah_data_controller.dart';

class SurahController extends GetxController {

  RxList<SurahAlQuran>? searchResults;
  TextEditingController? searchText = TextEditingController();
  RxList<SurahAlQuran> surahDataList = <SurahAlQuran>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getSurahData() async {
    final surahData = await SurahDataController().getSurah();
    if (surahData.isNotEmpty) {
      surahDataList.value = List.from(surahData);
    }
    isLoading.value = false;
  }

  void onSearch(String text) {
    searchText!.text = text;
    searchResults!.value = surahDataList
        .where((element) => element.titleSurahIndonesia
            .split("-")
            .join(" ")
            .toLowerCase()
            .contains(searchText!.text.toLowerCase()))
        .toList()
        .obs;
    update();
  }

 
  void onClear() {
    searchText!.clear();
    searchResults!.value = RxList.from(surahDataList);
    update();
  }

 
  @override
  void onInit() async{
    await getSurahData();
    searchResults = RxList.from(surahDataList);
    update();
    super.onInit();
  }

  void showTafsir(
      BuildContext context, String titleSurah, String tafsirContent) {
    AlertDialogUtils.showDialogUtils(context,
        title: Text(
          "Tafsir Surah $titleSurah",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
        content: Text(
          tafsirContent,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 118, 174, 254),
                        Color.fromARGB(255, 53, 242, 214),
                      ]),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Close",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          )
        ]);
  }
}