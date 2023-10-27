class AyatAlQuran {
  int ayatNumber;
  int juz;
  String arabicAyat;
  String latinAyat;
  String ayatTranslation;
  String interpretation;
  dynamic audio;
  bool isPlaying;

  AyatAlQuran({
    required this.ayatNumber,
    required this.juz,
    required this.arabicAyat,
    required this.latinAyat,
    required this.ayatTranslation,
    required this.interpretation,
    required this.audio,
    required this.isPlaying,
  });

  factory AyatAlQuran.fromJson(Map<String, dynamic> json) {
    return AyatAlQuran(
        ayatNumber: json["number"]["insurah"],
        juz: json["juz"],
        arabicAyat: json["text"]["ar"],
        latinAyat: json["text"]["read"]["id"],
        ayatTranslation: json["translation"]["id"],
        interpretation: json["tafsir"]["id"],
        audio: json["audio"]["url"],
        isPlaying: false);
  }

  static List<AyatAlQuran> ayatAlQuranFromSnapshot(List snapshot) {
    return snapshot.map((data) => AyatAlQuran.fromJson(data)).toList();
  }

  @override
  String toString() {
    return """Ayat
        {
          ayatNumber : $ayatNumber,
          arabicAyat: $arabicAyat, 
          latinAyat: $latinAyat, 
          ayatTranslation: $ayatTranslation, 
          audio: $audio
        }""";
  }
}
