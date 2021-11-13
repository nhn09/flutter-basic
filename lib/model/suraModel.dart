// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names

class Surah {
  final String? namesimple;
  final String? translated_name;
  final int? verses_count;
  final int? id;
  final String? revelation_place;

  Surah(
      {this.namesimple = "",
      this.revelation_place = " ",
      this.translated_name = "",
      this.id,
      this.verses_count = 0});
  factory Surah.fromJson(dynamic json) {
    return Surah(
        namesimple: json["name_simple"] as String,
        revelation_place: json["revelation_place"],
        translated_name: json["translated_name"]["name"] as String,
        id: json["id"] as int,
        verses_count: json["verses_count"] as int);
  }
  static List<Surah?> surahFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Surah.fromJson(data);
    }).toList();
  }
}
