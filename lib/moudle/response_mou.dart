import 'dart:convert';

List<ResponseMou> responseMouFromJson(String str) => List<ResponseMou>.from(
    json.decode(str).map((x) => ResponseMou.fromJson(x)));

String responseMouToJson(List<ResponseMou> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseMou {
  ResponseMou({
    this.id,
    this.colleg,
    this.number,
  });

  String id;
  String colleg;
  String number;

  factory ResponseMou.fromJson(Map<String, dynamic> json) => ResponseMou(
        id: json["id"] == null ? null : json["id"],
        colleg: json["colleg"] == null ? null : json["colleg"],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "colleg": colleg == null ? null : colleg,
        "number": number == null ? null : number,
      };
}
