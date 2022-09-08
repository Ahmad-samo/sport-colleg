import 'dart:convert';

List<TeamNameMou> teamNameMouFromJson(String str) => List<TeamNameMou>.from(
    json.decode(str).map((x) => TeamNameMou.fromJson(x)));

String teamNameMouToJson(List<TeamNameMou> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamNameMou {
  TeamNameMou({
    this.id,
    this.nameTeam,
  });

  String id;
  String nameTeam;

  factory TeamNameMou.fromJson(Map<String, dynamic> json) => TeamNameMou(
        id: json["id"] == null ? null : json["id"],
        nameTeam: json["name_team"] == null ? null : json["name_team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name_team": nameTeam == null ? null : nameTeam,
      };
}
