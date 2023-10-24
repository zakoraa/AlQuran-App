// ignore_for_file: avoid_print

import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:get/get.dart';

import '../../repository/ayat_al_quran_service.dart';

class AyatAlQuranController extends GetxController {
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

     // print("""
      //   ayatNumber: ${data["data"]["ayahs"][0]["number"]["insurah"]},
      //   arabicAyat: ${data["data"]["ayahs"][0]["text"]["ar"]},
      //   latinAyat: ${data["data"]["ayahs"][0]["text"]["read"]["id"]},
      //   ayatTranslation: ${data["data"]["ayahs"][0]["translation"]["id"]},
      //   audio: ${data["data"]["ayahs"][0]["audio"]["url"]}""");
