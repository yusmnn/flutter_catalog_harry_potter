import 'dart:convert';

class GetAllCharacterResponseModel {
  String? id;
  String? name;
  List<String>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<String>? alternateActors;
  bool? alive;
  String? image;

  GetAllCharacterResponseModel({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  factory GetAllCharacterResponseModel.fromJson(String str) =>
      GetAllCharacterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllCharacterResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllCharacterResponseModel(
        id: json["id"],
        name: json["name"],
        alternateNames: json["alternate_names"] == null
            ? []
            : List<String>.from(json["alternate_names"]!.map((x) => x)),
        species: json["species"],
        gender: json["gender"],
        house: json["house"],
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        wizard: json["wizard"],
        ancestry: json["ancestry"],
        eyeColour: json["eyeColour"],
        hairColour: json["hairColour"],
        wand: json["wand"] == null ? null : Wand.fromMap(json["wand"]),
        patronus: json["patronus"],
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors: json["alternate_actors"] == null
            ? []
            : List<String>.from(json["alternate_actors"]!.map((x) => x)),
        alive: json["alive"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "alternate_names": alternateNames == null
            ? []
            : List<dynamic>.from(alternateNames!.map((x) => x)),
        "species": species,
        "gender": gender,
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand?.toMap(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": alternateActors == null
            ? []
            : List<dynamic>.from(alternateActors!.map((x) => x)),
        "alive": alive,
        "image": image,
      };
}

class Wand {
  String? wood;
  String? core;
  double? length;

  Wand({
    this.wood,
    this.core,
    this.length,
  });

  factory Wand.fromJson(String str) => Wand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wand.fromMap(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: json["core"],
        length: json["length"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "wood": wood,
        "core": core,
        "length": length,
      };
}
