import 'package:get/get.dart';

class SurahAlQuranService extends GetConnect {
  Future<dynamic> getSurah() async {
    final response = await get("https://al-quran-api-three.vercel.app/quran");
    if (response.status.hasError) {
      return null;
    } else {
      return response.body;
    }
  }
}
