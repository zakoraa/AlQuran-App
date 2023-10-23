// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../model/surah_al_quran_model.dart';
import '../../repository/surah_al_quran_service.dart';

class SurahAlQuranController extends GetxController {
  Future<List<SurahAlQuran>> getSurah() async {
    try {
      final data = await SurahAlQuranService().getSurah();

      List<Map<String, dynamic>> dataList = [];
      for (dynamic i in data['data']) {
        dataList.add(i);
      }
      if (data.isNotEmpty) {
        print("Get Surah Data Success");
      }
      return SurahAlQuran.surahAlQuranFromSnapshot(dataList);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
