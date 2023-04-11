// To parse this JSON data, do
//
//     final translate = translateFromJson(jsonString);

import 'dart:convert';

Translate translateFromJson(String str) => Translate.fromJson(json.decode(str));

String translateToJson(Translate data) => json.encode(data.toJson());

class Translate {
  Translate({
    required this.data,
  });

  Data data;

  factory Translate.fromJson(Map<String, dynamic> json) => Translate(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.translations,
  });

  List<Translation> translations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  Translation({
    required this.translatedText,
  });

  String translatedText;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translatedText: json["translatedText"],
      );

  Map<String, dynamic> toJson() => {
        "translatedText": translatedText,
      };
}
