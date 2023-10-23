import 'package:get/get.dart';

import '../../model/al_quran_model.dart';
import '../alQuran/al_quran_controller.dart';

class HomeController extends GetxController {
  RxList<AlQuran> dataList = <AlQuran>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getData() async {
    final data = await AlQuranController().getSurah();
    if (data.isNotEmpty) {
      dataList.value = List.from(data);
    }
    isLoading.value = false;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getData();
  }
}
