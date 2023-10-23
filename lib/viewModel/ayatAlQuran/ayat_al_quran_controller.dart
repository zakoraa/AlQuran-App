// ignore_for_file: avoid_print

import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:get/get.dart';

import '../../repository/ayat_al_quran_service.dart';

class AyatAlQuranController extends GetxController {
  Future<List<AyatAlQuran>> getAyatAlQuran(int surahId, int ayatNumber) async {
    try {
      final data = await AyatAlQuranService().getAyat(surahId, ayatNumber);

      List<Map<String, dynamic>> dataList = [];
      for (var i in data["data"]) {
        dataList.add(i);
      }
      if (dataList.isNotEmpty) {
        print("Get Ayat Data Success");
      }
      return AyatAlQuran.ayatAlQuranFromSnapShot(dataList);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
