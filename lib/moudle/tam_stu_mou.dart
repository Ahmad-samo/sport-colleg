// To parse this JSON data, do
//
//     final temStuMou = temStuMouFromJson(jsonString);

import 'dart:convert';

List<TemStuMou> temStuMouFromJson(String str) => List<TemStuMou>.from(json.decode(str).map((x) => TemStuMou.fromJson(x)));

String temStuMouToJson(List<TemStuMou> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TemStuMou {
    TemStuMou({
        this.id,
        this.studentName,
        this.nameTeam,
    });

    String id;
    String studentName;
    String nameTeam;

    factory TemStuMou.fromJson(Map<String, dynamic> json) => TemStuMou(
        id: json["id"] == null ? null : json["id"],
        studentName: json["student_name"] == null ? null : json["student_name"],
        nameTeam: json["name_team"] == null ? null : json["name_team"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "student_name": studentName == null ? null : studentName,
        "name_team": nameTeam == null ? null : nameTeam,
    };
}
