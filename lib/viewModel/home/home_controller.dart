import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:al_quran/viewModel/ayatAlQuran/ayat_al_quran_controller.dart';
import 'package:get/get.dart';

import '../../model/surah_al_quran_model.dart';
import '../surahAlQuran/surah_al_quran_controller.dart';

class HomeController extends GetxController {
  RxList<SurahAlQuran> surahDataList = <SurahAlQuran>[].obs;
  RxList<AyatAlQuran> ayatDataList = <AyatAlQuran>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getSurahData() async {
    final surahData = await SurahAlQuranController().getSurah();
    if (surahData.isNotEmpty) {
      surahDataList.value = List.from(surahData);
    }
    isLoading.value = false;
  }

  Future<void> getAyatData(int surahId, int ayatNumber) async {
    final ayatData =
        await AyatAlQuranController().getAyatAlQuran(surahId, ayatNumber);
    if (ayatData.isNotEmpty) {
      ayatDataList.value = List.from(ayatData);
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSurahData();
  }
}
