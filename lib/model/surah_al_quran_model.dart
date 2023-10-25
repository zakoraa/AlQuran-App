class SurahAlQuran {
  int surahId;
  String titleSurahArabic;
  String titleSurahIndonesia;
  int numberOfAyat;
  String placeOfRevelation;
  dynamic preBismillah;
  String interpretation;
  String recitation;

  SurahAlQuran({
    required this.surahId,
    required this.titleSurahArabic,
    required this.titleSurahIndonesia,
    required this.numberOfAyat,
    required this.placeOfRevelation,
    required this.preBismillah,
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
        preBismillah: json["preBismillah"] != null
            ? json["preBismillah"]["text"]["ar"]
            : json["preBismillah"],
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
        preBismillah: $preBismillah, 
        interpretation: $interpretation, 
        recitation: $recitation
      }""";
  }
}
