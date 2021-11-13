// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names

class InsideSurah {
  late final String? namesimple;
  final String? details;

  InsideSurah({
    this.namesimple = "",
    this.details = " ",
  });
  factory InsideSurah.fromJson(dynamic json) {
    return InsideSurah(
        namesimple: json["language_name"] as String,
        details: json["short_text"]);
  }
  static List<InsideSurah?> surahFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return InsideSurah.fromJson(data);
    }).toList();
  }
}
