import 'package:get/get.dart';

class HomeTabController extends GetxController {
  RxInt selectedTab = 0.obs;

  void selectTab(dynamic tab) {
    selectedTab.value = tab;
    update();
  }
}
