class AlQuran {
  int surah;
  int ayat;
  String titleSurahArabic;
  String titleSurahIndonesia;
  String placeOfRevelation;
  String interpretation;
  String recitation;

  AlQuran({
    required this.surah,
    required this.ayat,
    required this.titleSurahArabic,
    required this.titleSurahIndonesia,
    required this.placeOfRevelation,
    required this.interpretation,
    required this.recitation,
  });

  factory AlQuran.fromJson(Map<String, dynamic> json) {
    return AlQuran(
        surah: json["number"],
        ayat: json["ayahCount"],
        titleSurahArabic: json["asma"]["ar"]["short"],
        titleSurahIndonesia: json["asma"]["id"]["short"],
        placeOfRevelation: json["type"]["id"],
        interpretation: json["tafsir"]["id"],
        recitation: json["recitation"]["full"]);
  }

  static List<AlQuran> alQuranFromSnapshot(List snapshot) {
    return snapshot.map((data) => AlQuran.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'AlQuran{'
        'surah: $surah, '
        'ayat: $ayat, '
        'titleSurahArabic: $titleSurahArabic, '
        'titleSurahIndonesia: $titleSurahIndonesia, '
        'placeOfRevelation: $placeOfRevelation, '
        'interpretation: $interpretation, '
        'recitation: $recitation}';
  }
}
