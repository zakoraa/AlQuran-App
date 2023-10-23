import 'package:get/get.dart';

class AyatAlQuranService extends GetConnect {
  Future<dynamic> getAyat(int surahId, int ayatNumber) async {
    final response =
        await get("http://localhost:3001/quran/$surahId/$ayatNumber");

    if (response.status.hasError) {
      print("Error: ${response.statusText}");
      return null;
    } else {
      return response.body;
    }
  }
}
