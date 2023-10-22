import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/al_quran_model.dart';
import '../home/home_controller.dart';

class SearchViewController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  RxList<AlQuran> searchResults = RxList.empty();
  TextEditingController searchText = TextEditingController();

  void onSearch(String text) {
    searchText.text = text;
    if (searchText.text != "") {
      searchResults.value = homeController.dataList
          .where((element) => element.titleSurahIndonesia
              .split("-")
              .join(" ")
              .toLowerCase()
              .contains(searchText.text.toLowerCase()))
          .toList()
          .obs;
    } else {
      searchResults.value = List.empty();
    }
    update();
  }

  void onClear() {
    searchText.text = "";
    searchResults.clear();
    update();
  }
}
