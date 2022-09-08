// To parse this JSON data, do
//
//     final newsMou = newsMouFromJson(jsonString);

import 'dart:convert';

List<NewsMou> newsMouFromJson(String str) =>
    List<NewsMou>.from(json.decode(str).map((x) => NewsMou.fromJson(x)));

String newsMouToJson(List<NewsMou> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsMou {
  NewsMou({
    this.id,
    this.addres,
    this.text,
    this.date,
    this.name,
  });

  String id;
  String addres;
  String text;
  String date;
  String name;

  factory NewsMou.fromJson(Map<String, dynamic> json) => NewsMou(
        id: json["id"] == null ? null : json["id"],
        addres: json["addres"] == null ? null : json["addres"],
        text: json["text"] == null ? null : json["text"],
        date: json["date"] == null ? null : json["date"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "addres": addres == null ? null : addres,
        "text": text == null ? null : text,
        "date": date == null ? null : date,
        "name": name == null ? null : name,
      };
}
