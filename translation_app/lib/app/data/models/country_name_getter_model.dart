// To parse this JSON data, do
//
//     final getCountryName = getCountryNameFromJson(jsonString);

import 'dart:convert';

List<GetCountryName> getCountryNameFromJson(String str) =>
    List<GetCountryName>.from(
        json.decode(str).map((x) => GetCountryName.fromJson(x)));

String getCountryNameToJson(List<GetCountryName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCountryName {
  GetCountryName({
    required this.name,
  });

  Name name;

  factory GetCountryName.fromJson(Map<String, dynamic> json) => GetCountryName(
        name: Name.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
  });

  String common;
  String official;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
      };
}
