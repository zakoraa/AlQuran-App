class AyatAlQuran {
  int ayatNumber;
  String arabicAyat;
  String latinAyat;
  String ayatTranslation;
  dynamic audio;

  AyatAlQuran({
    required this.ayatNumber,
    required this.arabicAyat,
    required this.latinAyat,
    required this.ayatTranslation,
    required this.audio,
  });

  factory AyatAlQuran.fromJson(Map<String, dynamic> json) {
    return AyatAlQuran(
        ayatNumber: json["number"]["insurah"],
        arabicAyat: json["text"]["ar"],
        latinAyat: json["text"]["read"]["id"],
        ayatTranslation: json["translation"]["id"],
        audio: json["audio"]["url"]);
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
