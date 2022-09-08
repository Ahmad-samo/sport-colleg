import 'dart:convert';

List<SpoNameMou> spoNameMouFromJson(String str) =>
    List<SpoNameMou>.from(json.decode(str).map((x) => SpoNameMou.fromJson(x)));

String spoNameMouToJson(List<SpoNameMou> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpoNameMou {
  SpoNameMou({
    this.id,
    this.sportName,
  });

  String id;
  String sportName;

  factory SpoNameMou.fromJson(Map<String, dynamic> json) => SpoNameMou(
        id: json["id"] == null ? null : json["id"],
        sportName: json["sport_name"] == null ? null : json["sport_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "sport_name": sportName == null ? null : sportName,
      };
}
