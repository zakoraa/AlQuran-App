import 'package:get/get.dart';
import '../../model/surah_al_quran_model.dart';
import '../surahAlQuran/surah_al_quran_controller.dart';

class HomeController extends GetxController {
  RxList<SurahAlQuran> surahDataList = <SurahAlQuran>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getSurahData() async {
    final surahData = await SurahAlQuranController().getSurah();
    if (surahData.isNotEmpty) {
      surahDataList.value = List.from(surahData);
    }
    isLoading.value = false;
  }

  @override
  void onInit() async {
    await getSurahData();
    super.onInit();
  }
}
