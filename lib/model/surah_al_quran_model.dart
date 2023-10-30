class SurahAlQuran {
  int surahId;
  String titleSurahArabic;
  String titleSurahIndonesia;
  int numberOfAyat;
  String placeOfRevelation;
  String interpretation;
  String audio;
  bool isPlaying;

  SurahAlQuran({
    required this.surahId,
    required this.titleSurahArabic,
    required this.titleSurahIndonesia,
    required this.numberOfAyat,
    required this.placeOfRevelation,
    required this.interpretation,
    required this.audio,
    required this.isPlaying
  });

  factory SurahAlQuran.fromJson(Map<String, dynamic> json) {
    return SurahAlQuran(
        surahId: json["number"],
        titleSurahArabic: json["asma"]["ar"]["short"],
        titleSurahIndonesia: json["asma"]["id"]["short"],
        numberOfAyat: json["ayahCount"],
        placeOfRevelation: json["type"]["id"],
        interpretation: json["tafsir"]["id"],
        audio: json["recitation"]["full"],
        isPlaying: false
        );
  }

  static List<SurahAlQuran> surahAlQuranFromSnapshot(List snapshot) {
    return snapshot.map((data) => SurahAlQuran.fromJson(data)).toList();
  }
}
