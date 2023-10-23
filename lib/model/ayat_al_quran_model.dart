import 'package:al_quran/model/al_quran_model.dart';

class AyatAlQuran extends AlQuran {
  int ayatNumber;
  String arabicAyat;
  String latinAyat;
  String ayatTranslation;
  dynamic audio;

  AyatAlQuran({
    required super.surahId,
    required super.titleSurahIndonesia,
    required super.titleSurahArabic,
    required this.ayatNumber,
    required this.arabicAyat,
    required this.latinAyat,
    required this.ayatTranslation,
    required this.audio,
  });

  factory AyatAlQuran.fromJson(Map<String, dynamic> json) {
    return AyatAlQuran(
        surahId: json["number"],
        titleSurahArabic: json["asma"]["ar"]["short"],
        titleSurahIndonesia: json["asma"]["id"]["short"],
        ayatNumber: json["ayahs"]["number"]["insurah"],
        arabicAyat: json["ayahs"]["text"]["ar"],
        latinAyat: json["ayahs"]["text"]["id"],
        ayatTranslation: json["ayahs"]["translation"]["id"],
        audio: json["ayahs"]["audio"]["url"]);
  }

  static List<AyatAlQuran> ayatAlQuranFromSnapShot(List snapshot) {
    return snapshot.map((data) => AyatAlQuran.fromJson(data)).toList();
  }

  @override
  String toString() {
    return """Ayat
        {
          surahId: $surahId,
          titleSurahArabic: $titleSurahArabic, 
          titleSurahIndonesia: $titleSurahIndonesia, 
          arabicAyat: $arabicAyat, 
          latinAyat: $latinAyat, 
          ayatTranslation: $ayatTranslation, 
          audio: $audio
        }""";
  }
}
