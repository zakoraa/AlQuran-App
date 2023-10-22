import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/al_quran_model.dart';
import '../../viewModel/home/home_controller.dart';
import '../global/surah_list.dart';

class ColumnSurahList extends StatelessWidget {
  const ColumnSurahList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    List<AlQuran> items = homeController.dataList;
    return Column(
        children: List.generate(
            items.length, (index) => SurahList(index: index, items: items)));
  }
}
