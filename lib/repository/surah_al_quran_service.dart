import 'package:get/get.dart';

class SurahAlQuranService extends GetConnect {
  Future<dynamic> getSurah() async {
    final response = await get("https://al-quran-api-three.vercel.app/quran");
    print(response.statusCode);
    if (response.status.hasError) {
      print("Error: ${response.statusText}");
      return null;
    } else {
      return response.body;
    }
  }
}
