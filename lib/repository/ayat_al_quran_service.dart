import 'package:get/get.dart';

class AyatAlQuranService extends GetConnect {
  Future getAyat(int surahId) async {
    final response =
        await get("https://al-quran-api-three.vercel.app/quran/$surahId");

    if (response.status.hasError) {
      print("Error: ${response.statusText}");
      return null;
    } else {
      return response.body;
    }
  }
}
