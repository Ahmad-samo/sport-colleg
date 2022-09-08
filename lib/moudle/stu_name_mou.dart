import 'dart:convert';

List<StuNameMou> stuNameMouFromJson(String str) =>
    List<StuNameMou>.from(json.decode(str).map((x) => StuNameMou.fromJson(x)));

String stuNameMouToJson(List<StuNameMou> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StuNameMou {
  StuNameMou({
    this.id,
    this.studentName,
    this.num,
    this.age,
  });

  String id;
  String studentName;
  String num;
  String age;

  factory StuNameMou.fromJson(Map<String, dynamic> json) => StuNameMou(
        id: json["id"] == null ? null : json["id"],
        studentName: json["student_name"] == null ? null : json["student_name"],
        num: json["num"] == null ? null : json["num"],
        age: json["age"] == null ? null : json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "student_name": studentName == null ? null : studentName,
        "num": num == null ? null : num,
        "age": age == null ? null : age,
      };
}
