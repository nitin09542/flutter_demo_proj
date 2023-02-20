// To parse required this JSON data, do
//
//     final IndustryList = IndustryListFromJson(jsonString);

import 'dart:convert';

IndustryList IndustryListFromJson(String str) => IndustryList.fromJson(json.decode(str));

String IndustryListToJson(IndustryList data) => json.encode(data.toJson());

class IndustryList {
  IndustryList({
    required this.industries,
  });

  List<Industry> industries;

  factory IndustryList.fromJson(Map<String, dynamic> json) => IndustryList(
    industries: List<Industry>.from(json["industries"].map((x) => Industry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "industries": List<dynamic>.from(industries.map((x) => x.toJson())),
  };
}

class Industry {
  Industry({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
