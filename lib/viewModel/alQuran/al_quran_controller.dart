// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../model/al_quran_model.dart';
import '../../repository/al_quran_service.dart';

class AlQuranController extends GetxController {
  var data = List<AlQuran>.empty().obs;

  Future<List<AlQuran>> getData() async {
    try {
      final data = await AlQuranService().getData();

      List dataList = [];
      for (dynamic i in data['data']) {
        dataList.add(i);
      }
      if (data.isNotEmpty) {
        print("Get Data Success");
      }
      return AlQuran.alQuranFromSnapshot(dataList);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
