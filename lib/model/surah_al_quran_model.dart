import 'package:al_quran/model/al_quran_model.dart';

class SurahAlQuran extends AlQuran {
  int numberOfAyat;
  String placeOfRevelation;
  String interpretation;
  String recitation;

  SurahAlQuran({
    required super.surahId,
    required super.titleSurahArabic,
    required super.titleSurahIndonesia,
    required this.numberOfAyat,
    required this.placeOfRevelation,
    required this.interpretation,
    required this.recitation,
  });

  factory SurahAlQuran.fromJson(Map<String, dynamic> json) {
    return SurahAlQuran(
        surahId: json["number"],
        titleSurahArabic: json["asma"]["ar"]["short"],
        titleSurahIndonesia: json["asma"]["id"]["short"],
        numberOfAyat: json["ayahCount"],
        placeOfRevelation: json["type"]["id"],
        interpretation: json["tafsir"]["id"],
        recitation: json["recitation"]["full"]);
  }

  static List<SurahAlQuran> surahAlQuranFromSnapshot(List snapshot) {
    return snapshot.map((data) => SurahAlQuran.fromJson(data)).toList();
  }

  @override
  String toString() {
    return """SurahAlQuran
      {
        titleSurahArabic: $titleSurahArabic, 
        titleSurahIndonesia: $titleSurahIndonesia, 
        surah: $surahId, 
        numberOfAyat: $numberOfAyat, 
        placeOfRevelation: $placeOfRevelation, 
        interpretation: $interpretation, 
        recitation: $recitation
      }""";
  }
}
