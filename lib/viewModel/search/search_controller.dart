import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/surah_al_quran_model.dart';
import '../home/home_controller.dart';

class SearchViewController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  RxList<SurahAlQuran>? searchResults;
  TextEditingController searchText = TextEditingController();

  void onSearch(String text) {
    searchText.text = text;
    searchResults!.value = homeController.surahDataList
        .where((element) => element.titleSurahIndonesia
            .split("-")
            .join(" ")
            .toLowerCase()
            .contains(searchText.text.toLowerCase()))
        .toList()
        .obs;
    update();
  }

  void onClear() {
    searchText.clear();
    searchResults!.value = RxList.from(homeController.surahDataList);
    update();
  }

  @override
  void onInit() {
    searchResults = RxList.from(homeController.surahDataList);
    super.onInit();
    update();
  }
}
