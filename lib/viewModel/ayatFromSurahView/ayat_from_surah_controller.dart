import 'package:get/get.dart';

import '../../model/ayat_al_quran_model.dart';
import '../ayatData/ayat_data_controller.dart';

class AyatFromSurahController extends GetxController {
  RxList<AyatAlQuran> ayatDataList = <AyatAlQuran>[].obs;
  RxBool isLoading = true.obs;
  RxBool isSuccess = false.obs;
  RxInt surahId;

  AyatFromSurahController({required this.surahId});

  Future<void> getAyatData(int surahId) async {
    final ayatData = await AyatDataController().getAyatAlQuran(surahId);
    if (ayatData.isNotEmpty) {
      ayatDataList.value = List.from(ayatData);
      isSuccess.value = true;
    }
    isLoading.value = false;
  }

  @override
  void onInit() async {
    await getAyatData(surahId.value);
    super.onInit();
  }
}
