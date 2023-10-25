import 'package:get/get.dart';

import '../../model/ayat_al_quran_model.dart';
import '../ayatAlQuran/ayat_al_quran_controller.dart';

class AyatFromSurahController extends GetxController {
  RxList<AyatAlQuran> ayatDataList = <AyatAlQuran>[].obs;
  RxBool isLoading = true.obs;
  RxInt surahId;

  AyatFromSurahController(
      {required this.surahId});

  Future<void> getAyatData(int surahId) async {
    final ayatData = await AyatAlQuranController().getAyatAlQuran(surahId);
    if (ayatData.isNotEmpty) {
      ayatDataList.value = List.from(ayatData);
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    getAyatData(surahId.value);
    super.onInit();
  }
}
