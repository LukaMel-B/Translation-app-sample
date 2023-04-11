// To parse this JSON data, do
//
//     final languages = languagesFromJson(jsonString);

import 'dart:convert';

Languages languagesFromJson(String str) => Languages.fromJson(json.decode(str));

String languagesToJson(Languages data) => json.encode(data.toJson());

class Languages {
  Languages({
    required this.data,
  });

  Data data;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.languages,
  });

  List<Language> languages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    required this.language,
    required this.name,
  });

  String language;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "name": name,
      };
}
