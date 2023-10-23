import 'package:get/get.dart';

class AlQuranService extends GetConnect {
  Future<dynamic> getSurah() async {
    final response = await get("https://quran-data.vercel.app/quran");
    if (response.status.hasError) {
      print("Error: ${response.statusText}");
      return null;
    } else {
      return response.body;
    }
  }
}
