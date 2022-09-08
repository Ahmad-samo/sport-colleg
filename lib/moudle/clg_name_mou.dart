
import 'dart:convert';

List<ClgNameMou> clgNameMouFromJson(String str) => List<ClgNameMou>.from(json.decode(str).map((x) => ClgNameMou.fromJson(x)));

String clgNameMouToJson(List<ClgNameMou> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClgNameMou {
    ClgNameMou({
        this.id,
        this.collegName,
    });

    String id;
    String collegName;

    factory ClgNameMou.fromJson(Map<String, dynamic> json) => ClgNameMou(
        id: json["id"] == null ? null : json["id"],
        collegName: json["colleg_name"] == null ? null : json["colleg_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "colleg_name": collegName == null ? null : collegName,
    };
}
