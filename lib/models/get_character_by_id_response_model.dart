class GetCharacterByIdResponseModel {
  final String? id;
  final String? name;
  final List<String>? alternateNames;
  final String? species;
  final String? gender;
  final String? house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool? wizard;
  final String? ancestry;
  final String? eyeColour;
  final String? hairColour;
  final Wand? wand; // Nested object
  final String? patronus;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;
  final List<String>? alternateActors;
  final bool? alive;
  final String? image;

  GetCharacterByIdResponseModel({
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

  factory GetCharacterByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return GetCharacterByIdResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      alternateNames: (json['alternate_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      house: json['house'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      yearOfBirth: json['yearOfBirth'] as int?,
      wizard: json['wizard'] as bool?,
      ancestry: json['ancestry'] as String?,
      eyeColour: json['eyeColour'] as String?,
      hairColour: json['hairColour'] as String?,
      wand: json['wand'] != null ? Wand.fromJson(json['wand']) : null,
      patronus: json['patronus'] as String?,
      hogwartsStudent: json['hogwartsStudent'] as bool?,
      hogwartsStaff: json['hogwartsStaff'] as bool?,
      actor: json['actor'] as String?,
      alternateActors: (json['alternate_actors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alive: json['alive'] as bool?,
      image: json['image'] as String?,
    );
  }
}

class Wand {
  final String? wood;
  final String? core;
  final double? length;

  Wand({this.wood, this.core, this.length});

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(
      wood: json['wood'] as String?,
      core: json['core'] as String?,
      length: (json['length'] as num?)?.toDouble(),
    );
  }
}
