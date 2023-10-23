class SurahAlQuran {
  int surahNumber;
  int numberOfAyat;
  String titleSurahArabic;
  String titleSurahIndonesia;
  String placeOfRevelation;
  String interpretation;
  String recitation;

  SurahAlQuran({
    required this.surahNumber,
    required this.numberOfAyat,
    required this.titleSurahArabic,
    required this.titleSurahIndonesia,
    required this.placeOfRevelation,
    required this.interpretation,
    required this.recitation,
  });

  factory SurahAlQuran.fromJson(Map<String, dynamic> json) {
    return SurahAlQuran(
        surahNumber: json["number"],
        numberOfAyat: json["ayahCount"],
        titleSurahArabic: json["asma"]["ar"]["short"],
        titleSurahIndonesia: json["asma"]["id"]["short"],
        placeOfRevelation: json["type"]["id"],
        interpretation: json["tafsir"]["id"],
        recitation: json["recitation"]["full"]);
  }

  static List<SurahAlQuran> surahAlQuranFromSnapshot(List snapshot) {
    return snapshot.map((data) => SurahAlQuran.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'SurahAlQuran{'
        'surah: $surahNumber, '
        'numberOfAyat: $numberOfAyat, '
        'titleSurahArabic: $titleSurahArabic, '
        'titleSurahIndonesia: $titleSurahIndonesia, '
        'placeOfRevelation: $placeOfRevelation, '
        'interpretation: $interpretation, '
        'recitation: $recitation}';
  }
}
