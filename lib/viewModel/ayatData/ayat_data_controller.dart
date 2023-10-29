// ignore_for_file: avoid_print

import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:get/get.dart';

import '../../repository/ayat_al_quran_service.dart';

class AyatDataController extends GetxController {
  Future<dynamic> getAyatAlQuran(int surahId) async {
    try {
      final data = await AyatAlQuranService().getAyat(surahId);

      List<Map<String, dynamic>> dataList = [];
      for (var i in data["data"]["ayahs"]) {
        dataList.add(i);
      }
      if (dataList.isNotEmpty) {
        print("Get Ayat Data Success");
      }

      return AyatAlQuran.ayatAlQuranFromSnapshot(dataList);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}