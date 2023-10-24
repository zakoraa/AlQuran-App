import 'package:get/get.dart';

import '../../model/ayat_al_quran_model.dart';
import '../ayatAlQuran/ayat_al_quran_controller.dart';

class SurahDetailController extends GetxController {
  RxList<AyatAlQuran> ayatDataList = <AyatAlQuran>[].obs;
  RxBool isLoading = true.obs;
  final AyatAlQuranController _ayatAlQuranController =
      Get.put(AyatAlQuranController());

  Future<void> getAyatData(int surahId) async {
    final ayatData = await _ayatAlQuranController.getAyatAlQuran(surahId);
    if (ayatData.isNotEmpty) {
      ayatDataList.value = List.from(ayatData);
    }
    isLoading.value = false;
  }
}
