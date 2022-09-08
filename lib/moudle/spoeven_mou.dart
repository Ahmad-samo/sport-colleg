import 'dart:convert';

List<SpoevenNameMou> spoevenNameMouFromJson(String str) =>
    List<SpoevenNameMou>.from(
        json.decode(str).map((x) => SpoevenNameMou.fromJson(x)));

String spoevenNameMouToJson(List<SpoevenNameMou> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpoevenNameMou {
  SpoevenNameMou({
    this.id,
    this.evenName,
    this.type,
    this.date,
    this.image,
  });

  String id;
  String evenName;
  String type;
  String date;
  String image;

  factory SpoevenNameMou.fromJson(Map<String, dynamic> json) => SpoevenNameMou(
        id: json["id"] == null ? null : json["id"],
        evenName: json["even_name"] == null ? null : json["even_name"],
        type: json["type"] == null ? null : json["type"],
        date: json["date"] == null ? null : json["date"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "even_name": evenName == null ? null : evenName,
        "type": type == null ? null : type,
        "date": date == null ? null : date,
        "image": image == null ? null : image,
      };
}
